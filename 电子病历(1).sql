USE [YTHIS]
GO
/****** Object:  StoredProcedure [dbo].[P_UPLOAD_业务数据]    Script Date: 2021/3/25 15:00:29 ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


ALTER PROC [dbo].[P_UPLOAD_业务数据](@Date_from DATETIME,@date_to DATETIME)
AS 
IF @Date_from IS NULL
SET @Date_from=FORMAT(DATEADD(DAY,-1,GETDATE()),'yyyy-MM-dd');
IF @date_to IS NULL
SET @date_to=FORMAT(DATEADD(DAY,-1,GETDATE()),'yyyy-MM-dd')+' 23:59:59'; 
---------------------------门急诊业务类
---2.2.1.	门(急)诊挂号表(REGISTRATION_RECORD)
BEGIN TRY
INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,PATIENT_LOCAL_ID,REG_SERIAL_NO,OUTPATIENT_NO,VISIT_COUNT,REG_TYPE_CODE,REG_TYPE,
REG_WAY_CODE,REG_WAY,REG_FEE,RESVER_WAY_CODE,RESVER_WAY,REG_NON_FLAG,OUTPATIENT_FLAG,FIRST_RETURN_FLAG,IS_MEDICAL_FLAG,REG_NON_DATE,CLINIC_DATE,
MEDICAL_PAY_WAY_CODE,PAY_WAY,CLINIC_DEPT_CODE,CLINIC_DEPT_NAME,CLINIC_DOCTOR_CODE,CLINIC_DOCTOR_NAME,REG_TIME_SLOT,CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS
FROM REGISTRATION_RECORD')
SELECT  DISTINCT
        ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,
        CONCAT(( SELECT ZZJGDM
                 FROM   dbo.T_JGGL
               ), A.病人ID) AS PATIENT_LOCAL_ID,
		A.ID AS REG_SERIAL_NO,
		A.门诊号 AS OUTPATIENT_NO,
	   (SELECT dbo.F_就诊次数(A.病人ID))  AS VISIT_COUNT,
		'1' AS REG_TYPE_CODE,
		'普通门诊' AS REG_TYPE,
		'1' AS REG_WAY_CODE,
		'现场' AS REG_WAY,
		(  select sum(结帐金额)  from dbo.门诊费用记录  WHERE 
		  A.NO=NO AND 记录性质=4 AND  A.记录状态=记录状态) AS REG_FEE,
		'1' AS RESVER_WAY_CODE,
		'9' AS RESVER_WAY,
		CASE A.记录状态 WHEN '1' THEN '1'  WHEN '3' THEN '1' ELSE '2' END  AS REG_NON_FLAG,
		CASE A.急诊 WHEN '1' THEN '2' ELSE '1' END AS OUTPATIENT_FLAG,
		CASE A.复诊 WHEN '1' THEN '2' ELSE '1' END  FIRST_RETURN_FLAG,
		CASE A.执行状态 WHEN '0' THEN '2' ELSE '1' END  IS_MEDICAL_FLAG,
		A.登记时间 AS REG_NON_DATE,
		A.执行时间 AS CLINIC_DATE,
		 CASE E.医疗付款方式 WHEN '城镇职工医疗保险' THEN '01' 
		 WHEN '城镇医保' THEN '02' 
		 WHEN '新型农村合作医疗' THEN '03'
		 WHEN '商业医疗保险' THEN '07'
		 ELSE '99' END AS MEDICAL_PAY_WAY_CODE,
		F.结算方式 AS PAY_WAY,
		C.编码 AS  CLINIC_DEPT_CODE,
		C.名称 AS  CLINIC_DEPT_NAME,
		D.编号 AS  CLINIC_DOCTOR_CODE,
		D.姓名 AS  CLINIC_DOCTOR_NAME,
	    '08:00-12:00,12:00-5:30'  AS REG_TIME_SLOT,
		A.登记时间 AS CREATE_DATE,
		A.登记时间 AS UPDATE_DATE,
		GETDATE() AS  UPLOAD_TIME,
		'1' AS ESTATUS
FROM    dbo.病人挂号记录 A ( NOLOCK )
		LEFT JOIN dbo.病人预交记录 F ON   A.NO=F.NO AND F.记录性质=4
		LEFT JOIN dbo.部门表 C ON A.执行部门ID=C.ID
		LEFT JOIN dbo.人员表 D ON A.执行人=D.姓名
		LEFT JOIN 病人信息 E ON A.病人ID=E.ID
WHERE   A.登记时间  BETWEEN @Date_from AND @date_to  
END TRY
BEGIN CATCH
INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
VALUES('门(急)诊挂号表',ERROR_MESSAGE(),GETDATE())
END CATCH
---2.2.4.	西药处方(WESTERN_PRESCRIPTION)
BEGIN TRY
INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,CLINIC_DEPT_CODE,CLINIC_DEPT_NAME,PATIENT_LOCAL_ID,PRESCRIBE_SERIAL_NO,PRESCRIBE_NO,
PRESCRIPTION_NOTE_INF,PRESCRIPTION_DRUG_PHARM_SIG,PRESCRIPTION_CHECK_SIG,PRESCRIPTION_MEDICINE_NO,OUTPATIENT_NO,VISIT_COUNT,NAME,AGE_YEAR,AGE_MONTH,
GENDER_CODE,PRESCRIPTION_DEP_CODE,PRESCRIPTION_DEP_NAME,PRESCRIBE_INPUT_DATE,PRESCRIBE_INPUT_SIG,PRESCRIBE_CHK_SIG,PRESCRIBE_DISPEN_SIG,DOCTOR_CODE,
DOCTOR_NAME,PRESCRIPTION_IDENTIFIER_NO,PRESCRIPTION_ITEM_CLASS_CODE,PRESCRIPTION_ITEM_CLASS_NAME,PRESCRIPTION_DETAIL_CODE,PRESCRIPTION_DETAIL_NAME,
TRIALPARTY_PHA_CODE,TRIALPARTY_PHA_NAME,DISEASE_DIAGNOSIS_CODE,DRUG_ID,DRUG_NAME,DRUG_SPECIFICATIONS,DRUG_DOSAGE_CODE,DRUG_DOSAGE_NAME,DRUG_USE_DOSE,
DRUG_USE_DOSE_UNIT,DRUG_USE_FREQUENCY_CODE,DRUG_USE_FREQUENCY,DRUG_USE_ROUTE_CODE,DRUG_USE_ROUTE_NAME,DRUG_USE_TOTAL_DOSE,DRUG_USE_DAYS,YPLB,
SKIN_TEST_CRITERION,IS_UNIFIED_PROCUREMENT_DRUGS,BASE_DRUG_CODE,INSUR_CODE,DRUG_PROCUREMENT_CODE,ANTIBACTERIALS_FLAG,PRESCRIPTION_DRUG_AMOUNT,DRUGS_UNIT,
UNIT_PRICE,TOT_AMOUNT,QUANTITY,MEDICATION_START_TIME,MEDICATION_STOP_TIME,MEDICATION_DAYS,PRESCRIBE_DAYS,ANTIBA_DRUGS_LEVEL,ANTIBA_DRUGS_LEVEL_NAME,MEDICINE_TYPE_CODE,
MEDICINE_TYPE_NAME,IF_MAIN_MEDICINE,IF_BASE_MEDICINE,ADAPTIVE_FLAG,URGENT_FLAG,MED_VIEW_FLAG,DRUG_CODE,SKIN_TEST_RESULT,REG_SN,
SETTLEMENT_SN,RESUND_IDEN,DISPENSING_NO,DRUG_WITHDRAWAL_IDEN,CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS FROM WESTERN_PRESCRIPTION')
SELECT  DISTINCT
        ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,
        B.编码 AS CLINIC_DEPT_CODE,
		B.名称 AS CLINIC_DEPT_NAME ,
		CONCAT(( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ),E.ID) AS PATIENT_LOCAL_ID,
		A.序号 AS PRESCRIBE_SERIAL_NO,
		A.NO AS PRESCRIBE_NO,
		A.摘要 AS PRESCRIPTION_NOTE_INF,
		F.配药人 AS PRESCRIPTION_DRUG_PHARM_SIG,
		F.核查人 AS PRESCRIPTION_CHECK_SIG,
		A.序号 AS PRESCRIPTION_MEDICINE_NO,
		L.门诊号 AS OUTPATIENT_NO,
		(SELECT dbo.F_就诊次数(A.病人ID)) AS VISIT_COUNT,
		A.姓名 AS NAME,
		CASE WHEN CHARINDEX('岁',A.年龄)<>0 THEN 
		REPLACE(REPLACE(A.年龄,'岁',''),'月','') ELSE '0'
		 END  AS AGE_YEAR,
		CASE WHEN CHARINDEX('岁',A.年龄)=0 THEN
		CASE WHEN CHARINDEX('月',A.年龄)=0 THEN
		'0'
		ELSE 
		CASE WHEN CHARINDEX('月',A.年龄)<>0 AND  CHARINDEX('天',A.年龄)<>0 THEN
		CONCAT(SUBSTRING(A.年龄,1,CHARINDEX('月',A.年龄)-1),SUBSTRING(A.年龄,CHARINDEX('月',A.年龄)+1,CHARINDEX('天',A.年龄)-CHARINDEX('月',A.年龄)-1),'/',30)
		ELSE
		SUBSTRING(A.年龄,1,CHARINDEX('月',A.年龄)-1) END
		END END  AS AGE_MONTH,
		CASE E.性别 WHEN '男' THEN '1'  WHEN '女' THEN '2' WHEN '未知' THEN '0' ELSE '9' END AS GENDER_CODE,
		C.编码 AS PRESCRIPTION_DEP_CODE,
		C.名称 AS PRESCRIPTION_DEP_NAME,
		A.登记时间 AS PRESCRIBE_INPUT_DATE,
		A.开单人 AS PRESCRIBE_INPUT_SIG,
		F.审核人 AS PRESCRIBE_CHK_SIG,
		F.配药人 AS PRESCRIBE_DISPEN_SIG,
		ISNULL(D.编号,'-') AS DOCTOR_CODE,
		ISNULL(D.姓名,'-') AS DOCTOR_NAME,
		CASE A.收费类别 WHEN '6' THEN '10' ELSE '1' END AS PRESCRIPTION_IDENTIFIER_NO,
		CASE A.收费类别 WHEN '6' THEN '12' ELSE '11' END  AS PRESCRIPTION_ITEM_CLASS_CODE,
		CASE A.收费类别 WHEN '6' THEN '中成药' ELSE '西药' END AS PRESCRIPTION_ITEM_CLASS_NAME,
		H.编码 AS PRESCRIPTION_DETAIL_CODE,
		H.名称 AS PRESCRIPTION_DETAIL_NAME,
		F1.编号 AS TRIALPARTY_PHA_CODE,
		F.审核人 AS TRIALPARTY_PHA_NAME,
		ISNULL(I2.国临码,I.诊断ID) AS DISEASE_DIAGNOSIS_CODE,
		H.编码 AS DRUG_ID,
		H.名称 AS DRUG_NAME,
		H.规格 AS DRUG_SPECIFICATIONS,
		'' AS DRUG_DOSAGE_CODE,
          CASE WHEN H.类别 IN ( '5', '6', '7' )
             THEN CASE WHEN H.剂型 IN ( '片剂' ) THEN '01'
                       WHEN H.剂型 IN ( '胶囊(胶丸、滴丸)' ) THEN '20'
                       WHEN H.剂型 IN ( '丸剂' ) THEN '21'
                       WHEN H.剂型 IN ( '干混悬剂' ) THEN '71'
                       WHEN H.剂型 IN ( '颗粒剂' ) THEN '56'
                       WHEN H.剂型 IN ( '冲剂' ) THEN '54'
                       WHEN H.剂型 IN ( '粉剂(粉针剂)' ) THEN '15'
                       WHEN H.剂型 IN ( '溶液剂(注射剂)' ) THEN '16'
                       WHEN H.剂型 IN ( '口服液' ) THEN '31'
                       WHEN H.剂型 IN ( '酊剂' ) THEN '34'
                       ELSE '99'
                  END
             ELSE ''
        END AS DRUG_DOSAGE_NAME,
		K.单次用量 AS DRUG_USE_DOSE,
		H.剂量单位 AS DRUG_USE_DOSE_UNIT,
		CASE k.执行频次 WHEN '每天二次' THEN '01'
		   WHEN '每天四次' THEN '10'
		   WHEN '每天一次' THEN '09'
		   WHEN '每天上午一次' THEN '09'
		   WHEN '隔日一次' THEN '11'
		   WHEN '每周二次' THEN '02'
		   WHEN '每周一次' THEN '12'
		   WHEN '每小时一次' THEN '05'
		   WHEN '每3小时一次' THEN '06'
		   WHEN '每6小时一次' THEN '07'
		   WHEN '每8小时一次' THEN '08'
		   WHEN '每12小时一次' THEN '04'
		   WHEN '每天晚上一次' THEN '03'
		   WHEN '立即' THEN '13'
		 ELSE '99' END AS DRUG_USE_FREQUENCY_CODE,
		k.执行频次 AS DRUG_USE_FREQUENCY,
		CASE 
		   WHEN k.用法 IN('口服','开水冲服') THEN '1'
		   WHEN k.用法 IN('肛门注入') THEN '2'
		   WHEN k.用法 IN('舌下含化') THEN '3'
		   WHEN k.用法 IN('蛛网膜下腔给药','硬膜外给药','羊膜腔内注射','宫颈注射','宫体注射') THEN '4'
		   WHEN k.用法 IN('皮下注射') THEN '401'
		   WHEN k.用法 IN('皮内注射') THEN '402'
		   WHEN k.用法 IN('肌肉注射') THEN '403'
		   WHEN k.用法 IN('静脉注射','静脉滴注') THEN '404'
		   WHEN k.用法 IN('喷雾吸入','吸入') THEN '5'
		   WHEN k.用法 IN('置阴道内','阴道冲洗') THEN '605'
		   WHEN k.用法 IN('气管吸入') THEN '606'
		   WHEN k.用法 IN('滴眼') THEN '607'
		   WHEN k.用法 IN('滴鼻') THEN '608'
		   WHEN k.用法 IN('外敷') THEN '611'
		   WHEN k.用法 IN('外搽') THEN '612'
		 ELSE '9' END  AS DRUG_USE_ROUTE_CODE,
		k.用法  AS DRUG_USE_ROUTE_NAME,
		k.总给予量 AS DRUG_USE_TOTAL_DOSE,
		k.天数 AS DRUG_USE_DAYS,
		CASE A.收费类别 WHEN '5' THEN '1' 
		ELSE '2' END AS YPLB,
		'' AS SKIN_TEST_CRITERION,
		'1' AS IS_UNIFIED_PROCUREMENT_DRUGS,
		'' AS BASE_DRUG_CODE,
		O.项目编码 AS INSUR_CODE,
		'' AS DRUG_PROCUREMENT_CODE,
		CASE Y.抗生素 WHEN '0' THEN '2' ELSE '1' END AS ANTIBACTERIALS_FLAG,
        A.结帐金额 AS PRESCRIPTION_DRUG_AMOUNT,
		H.计算单位 AS DRUGS_UNIT,
		A.标准单价 AS UNIT_PRICE,
		A.结帐金额 AS TOT_AMOUNT,
		A.数次 * A.付数 AS QUANTITY,
	    A.登记时间 AS MEDICATION_START_TIME,
		DATEADD(DAY,K.天数,A.登记时间) AS MEDICATION_STOP_TIME,
		K.天数 AS MEDICATION_DAYS,
		1 AS PRESCRIBE_DAYS,
		CASE ISNULL(Y.抗生素,0) WHEN 0 THEN null ELSE Y.抗生素 END AS ANTIBA_DRUGS_LEVEL,
		CASE  ISNULL(Y.抗生素,0) WHEN 0 THEN null ELSE 
		CASE Y.抗生素 WHEN '1' THEN  '非限制使用'
		 WHEN '2' THEN  '限制使用'
		 WHEN '3' THEN  '特殊使用' END
		 END ANTIBA_DRUGS_LEVEL_NAME,
		CASE R.名称 WHEN '抗生素类抗感染药物' THEN '0100'
		WHEN '清热解毒' THEN '0401'
		ELSE '9999' END AS  MEDICINE_TYPE_CODE,
		R.名称 AS MEDICINE_TYPE_NAME,
		'2' AS IF_MAIN_MEDICINE,
	    CASE	X.基本药物 WHEN '国家基本药物' THEN '1' ELSE '2' END AS IF_BASE_MEDICINE,
		'2' AS ADAPTIVE_FLAG,
		'2' AS URGENT_FLAG,
		'2' AS MED_VIEW_FLAG,
	 	 '' AS DRUG_CODE,
		 k.皮试结果 AS SKIN_TEST_RESULT,
		 L.ID AS REG_SN,
		 A.结帐ID AS SETTLEMENT_SN,
		 CASE WHEN A.记录状态 = 1 THEN '1' 
		 WHEN A.记录状态 =3 THEN '3' ELSE '2' END AS RESUND_IDEN,
		 F.NO AS DISPENSING_NO,
		 CASE F.发药方式 WHEN '1' THEN '1' ELSE '2' END DRUG_WITHDRAWAL_IDEN,
		 A.发生时间 AS CREATE_DATE,
		 A.发生时间 AS UPDATE_DATE,
		 GETDATE() AS  UPLOAD_TIME,
		'1' AS ESTATUS
FROM    dbo.门诊费用记录 A ( NOLOCK )
		LEFT JOIN dbo.部门表 B ON A.病人科室ID=B.ID
		LEFT JOIN dbo.部门表 C ON A.开单部门ID=C.ID
		LEFT JOIN dbo.人员表 D ON A.执行人=D.姓名
		LEFT JOIN 病人信息 E ON A.病人ID=E.ID
		LEFT JOIN dbo.药品收发记录 F ( NOLOCK )ON A.NO=F.NO AND A.ID=F.费用ID AND 单据='8'
		LEFT JOIN dbo.人员表 F1 ON F1.姓名=ISNULL(F.审核人,'-')
		LEFT JOIN dbo.收费项目目录 H( NOLOCK ) ON H.ID=A.收费细目ID
		LEFT JOIN 药品规格 X ON H.ID=X.药品ID
		LEFT JOIN dbo.诊疗项目目录 Q( NOLOCK ) ON X.药名ID=Q.ID 
		LEFT JOIN dbo.诊疗分类目录 R( NOLOCK ) ON Q.分类ID=R.ID
		LEFT JOIN dbo.药品特性 Y ON X.药名ID=Y.药名ID 
		LEFT JOIN dbo.病人医嘱记录 K ( NOLOCK )ON K.ID=A.医嘱序号
		LEFT JOIN dbo.病人挂号记录 L ( NOLOCK )ON K.挂号单=L.NO
		LEFT JOIN dbo.病人诊断记录 I ( NOLOCK )ON A.病人ID=I.病人ID AND I.主页ID=L.ID AND I.诊断次序=1
		LEFT JOIN 医保码与国临码对照 I2 ON I.诊断ID=I2.医保码
		LEFT JOIN dbo.疾病编码目录 J ( NOLOCK )ON I.诊断描述=J.名称
		LEFT JOIN dbo.保险支付项目 O ( NOLOCK )ON O.收费细目ID = A.收费细目ID AND O.险类 = 3	
WHERE   A.登记时间 BETWEEN @Date_from AND @date_to AND A.收费类别 IN('5','6')
        AND EXISTS (SELECT * FROM 药品规格  WHERE A.收费细目ID=药品ID AND ISNULL(材料,0)=0 )
        AND A.结帐ID IS NOT NULL
END TRY
BEGIN CATCH
INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
VALUES('西药处方',ERROR_MESSAGE(),GETDATE())
END CATCH
---2.2.6.	门(急)诊结算记录(OUTPATIENT_EMERG_SETTLEMENT)  
BEGIN TRY
INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,PATIENT_LOCAL_ID,VISIT_COUNT,OUTPATIENT_NO,REG_SERIAL_NO,SETTLE_SERIAL_NO,SETTLE_NO,
TRANS_TYPE,MEDI_EXP_PAY_CODE,PRESCRIBE_NO,APPLE_NO,COST_TYPE_CODE,COST_TYPE_NAME,DRUG_ID,DRUG_NAME,DRUG_PROCUREMENT_CODE,INSUR_CODE,INSUR_NAME,UNIT,AMOUNT,
COST_SUM,PERSONAL_EXPENSES,REIMB_COST_SUM,TOTAL_AMOUNT,INDIVI_EXP_OUT_INSUR,TOTAL_INSUR_AMOUNT,MEDICAL_INSUR_PAY,PAY_WITHIN_INSUR,RESUND_IDEN,RECEIPT_NO,
SETTLEMENT_DATE,CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS FROM OUTPATIENT_EMERG_SETTLEMENT')
SELECT DISTINCT
        ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,
        CONCAT(( SELECT ZZJGDM
                 FROM   dbo.T_JGGL
               ), B.ID) AS PATIENT_LOCAL_ID ,
         (SELECT dbo.F_就诊次数(D.病人ID))  AS VISIT_COUNT ,
        H.门诊号 AS OUTPATIENT_NO ,
        H.ID AS REG_SERIAL_NO ,
        D.ID AS SETTLE_SERIAL_NO ,
        1 AS SETTLE_NO ,
        CASE D.记录状态
          WHEN '1' THEN '1'
          ELSE '2'
        END AS TRANS_TYPE ,
        CASE B.医疗付款方式
          WHEN '城镇职工医疗保险' THEN '01'
          WHEN '城镇医保' THEN '02'
          WHEN '新型农村合作医疗' THEN '03'
          WHEN '商业医疗保险' THEN '07'
          ELSE '99'
        END AS MEDI_EXP_PAY_CODE ,
        D.序号 AS PRESCRIBE_NO ,
        D.NO AS APPLE_NO ,
        CASE D.收据费目
          WHEN '西药费' THEN '01'
          WHEN '中成药' THEN '02'
          WHEN '中草药' THEN '03'
          WHEN 'B超' THEN '07'
          WHEN '治疗费' THEN '08'
          WHEN '化验费' THEN '09'
          WHEN '手术费' THEN '10'
          WHEN '检查费' THEN '04'
          WHEN '床位费' THEN '17'
          WHEN '材料费' THEN '18'
          WHEN '挂号费' THEN '21'
          WHEN '诊查费' THEN '23'
          WHEN '护理费' THEN '19'
          WHEN '麻醉费' THEN '29'
          ELSE '99'
        END AS COST_TYPE_CODE ,
        D.收据费目 AS COST_TYPE_NAME ,
        E.编码 AS DRUG_ID ,
        E.名称 AS DRUG_NAME ,
        '' AS DRUG_PROCUREMENT_CODE ,
        F.项目编码 AS INSUR_CODE ,
        F.项目名称 AS INSUR_NAME ,
        E.计算单位 AS UNIT ,
        D.数次 * D.付数 AS AMOUNT ,
        D.标准单价 AS COST_SUM ,
        D.自费金额 AS PERSONAL_EXPENSES ,
        D.统筹金额-D.自费金额 AS REIMB_COST_SUM ,
        D.结帐金额 AS TOTAL_AMOUNT ,
        0.00 INDIVI_EXP_OUT_INSUR ,
        0.00 TOTAL_INSUR_AMOUNT ,
        0.00 MEDICAL_INSUR_PAY ,
        0.00 PAY_WITHIN_INSUR ,
        CASE D.记录状态
          WHEN '1' THEN '1'
          ELSE '2'
        END AS RESUND_IDEN ,
        D.实际票号 AS RECEIPT_NO ,
        A.收款时间 AS SETTLEMENT_DATE ,
        D.登记时间 AS CREATE_DATE ,
        NULL AS UPDATE_DATE ,
        GETDATE() AS UPLOAD_TIME ,
        '1' AS ESTATUS
FROM   	dbo.病人预交记录 A , dbo.门诊费用记录 D (nolock)		
		LEFT JOIN 病人信息 B (nolock)  ON D.病人ID = B.ID 
        LEFT JOIN dbo.收费项目目录 E (nolock)  ON D.收费细目ID = E.ID
        LEFT JOIN dbo.保险支付项目 F (nolock)  ON E.ID = F.收费细目ID
                                  AND F.险类 = 3   , 
		dbo.病人医嘱记录 C  (nolock)   , 
		dbo.病人挂号记录 H  (nolock)                  
WHERE  A.结帐ID=D.结帐ID AND C.ID = D.医嘱序号 AND  C.挂号单=h.NO
        AND A.收款时间 BETWEEN @Date_from AND @date_to
END TRY
BEGIN CATCH
INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
VALUES('门(急)诊结算记录',ERROR_MESSAGE(),GETDATE())
END CATCH		
---2.2.7.	门(急)诊发药记录(OUTPATIENT_DISPENSE_RECORD)
BEGIN TRY
INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,CLINIC_DEPT_CODE,CLINIC_DEPT_NAME,PATIENT_LOCAL_ID,BUSINESS_LOCAL_ID,PRESCRIBE_LOCAL_ID,
DRUG_ID,DRUG_PROCUREMENT_CODE,DRUG_NAME,INSUR_CODE,DRUG_SPECIFICATIONS,DISPENSING_QUANTITY,DISPENSING_UNIT,DISPENSER_PY_CODE,DISPENSER_PY_NAME,DISPENSER_PY_TIME,
DISPENSER_FY_CODE,DISPENSER_FY_NAME,DISPENSER_FY_TIME,DRUGS_BATCH_NUMBER,DRUGS_BATCH,DRUG_WITHDRAWAL_IDEN,DRUG_WITHDRAWAL_TIME,DRUG_WITHDRAWAL_PERSON_CODE,
DRUG_WITHDRAWAL_PERSON_NAME,PHARMACY_CODE,PHARMACY_NAME,CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS FROM OUTPATIENT_DISPENSE_RECORD')
SELECT  ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,
        C.编码 AS CLINIC_DEPT_CODE ,
        C.名称 AS CLINIC_DEPT_NAME ,
        CONCAT(( SELECT ZZJGDM
                 FROM   dbo.T_JGGL
               ), B.病人ID) AS PATIENT_LOCAL_ID ,
        A.序号 AS BUSINESS_LOCAL_ID ,
        A.NO AS PRESCRIBE_LOCAL_ID ,
        D.编码 AS DRUG_ID ,
        '' AS DRUG_PROCUREMENT_CODE ,
        D.名称 AS DRUG_NAME ,
        F.项目编码 AS INSUR_CODE ,
        D.规格 AS DRUG_SPECIFICATIONS ,
        A.实际数量 * A.付数 AS DISPENSING_QUANTITY ,
        D.计算单位 AS DISPENSING_UNIT ,
        E.编号 AS DISPENSER_PY_CODE ,
        A.配药人 AS DISPENSER_PY_NAME ,
        isNull(A.配药日期,A.审核日期) AS DISPENSER_PY_TIME ,
        H.编号 AS DISPENSER_FY_CODE ,
        A.审核人 AS DISPENSER_FY_NAME ,
        A.审核日期 AS DISPENSER_FY_TIME ,
        A.批号 AS DRUGS_BATCH_NUMBER ,
        A.批次 AS DRUGS_BATCH ,
        CASE WHEN A.记录状态%3=2
           THEN 1
          ELSE 0
        END AS DRUG_WITHDRAWAL_IDEN ,
        CASE WHEN A.记录状态 %3=2 THEN A.审核日期
             ELSE NULL
        END AS DRUG_WITHDRAWAL_TIME ,
        CASE WHEN A.记录状态 %3=2 THEN J.编号
             ELSE NULL
        END AS DRUG_WITHDRAWAL_PERSON_CODE ,
        CASE WHEN A.记录状态 %3=2 THEN J.姓名
             ELSE NULL
        END AS DRUG_WITHDRAWAL_PERSON_NAME ,
        K.编码 AS PHARMACY_CODE ,
        K.名称 AS PHARMACY_NAME ,
        A.填制日期 AS CREATE_DATE ,
        A.填制日期 AS UPDATE_DATE ,
        GETDATE() AS UPLOAD_TIME ,
        '1' AS ESTATUS
FROM    dbo.药品收发记录 A
        LEFT JOIN dbo.收费项目目录 D ON A.药品ID = D.ID
                                  AND D.类别 IN ( '5', '6', '7' )
        LEFT JOIN dbo.保险支付项目 F ON D.ID = F.收费细目ID
                                  AND F.险类 = 3
        LEFT JOIN dbo.人员表 E ON A.配药人 = E.姓名
        LEFT JOIN dbo.人员表 H ON A.审核人 = H.姓名
        LEFT JOIN dbo.人员表 J ON A.审核人 = J.姓名
        LEFT JOIN dbo.部门表 K ON A.库房ID = K.ID ,
        dbo.门诊费用记录 B
        LEFT JOIN dbo.部门表 C ON B.病人科室ID = C.ID
WHERE   A.NO = B.NO
        AND A.费用ID = B.ID
		AND A.单据='8'
		AND A.审核日期 BETWEEN @Date_from AND @date_to
		AND EXISTS(SELECT * FROM dbo.药品规格 WHERE A.药品ID=药品ID AND  ISNULL(材料,0)=0)
        AND A.发药方式 IS NOT NULL
		AND B.病人ID IS NOT NULL
END TRY
BEGIN CATCH
INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
VALUES('门(急)诊发药记录',ERROR_MESSAGE(),GETDATE())
END CATCH
---------------------------住院业务类
---2.3.1.	入院诊断(HOSPITALIZED_DIAGNOSIS)   
BEGIN TRY
INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,CLINIC_DEPT_CODE,CLINIC_DEPT_NAME,BUSINESS_LOCAL_ID,
ADMISSION_ID,PATIENT_LOCAL_ID,PATIENT_TYPE,PATIENT_TYPE_NAME,INPATIENT_NO,VISIT_COUNT,PATHOLOGY_NO,ADMISSION_DIAGNOSIS_PICKS,
DISEASE_TYPE_CODE,DIAGNOSIS_DATE,DISEASE_TYPE_NAME,DISEASE_MAIN_FLAG,WESTERN_DIAGNOSIS_CODE,WESTERN_DIAGNOSIS_NAME,CHINESE_DIAGNOSIS_CODE,
CHINESE_DIAGNOSIS_NAME,CHINESE_SYNDROME_CODE,CHINESE_SYNDROME_NAME,DIAGNOSIS_BASIS_CODE,CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS
 FROM HOSPITALIZED_DIAGNOSIS')
SELECT  ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,
        C.编码 AS CLINIC_DEPT_CODE ,
        C.名称 AS CLINIC_DEPT_NAME ,
        B.ID AS BUSINESS_LOCAL_ID ,
        CONCAT(A.病人ID,A.主页ID) AS ADMISSION_ID ,
        CONCAT(( SELECT ZZJGDM
                 FROM   dbo.T_JGGL
               ), A.病人ID) AS PATIENT_LOCAL_ID ,
        '3' AS PATIENT_TYPE ,
        '住院' AS PATIENT_TYPE_NAME ,
        A.住院号 AS INPATIENT_NO ,
        A.主页ID AS VISIT_COUNT ,
        '' AS PATHOLOGY_NO ,
        NULL AS ADMISSION_DIAGNOSIS_PICKS ,
        '31' AS DISEASE_TYPE_CODE ,
        B.记录日期 AS DIAGNOSIS_DATE ,
        '入院诊断' AS DISEASE_TYPE_NAME ,
        CASE B.诊断次序
          WHEN 1 THEN 1
          ELSE 2
        END AS DISEASE_MAIN_FLAG ,
        B2.编码 AS WESTERN_DIAGNOSIS_CODE ,
        B2.名称 AS WESTERN_DIAGNOSIS_NAME ,
        NULL AS CHINESE_DIAGNOSIS_CODE ,
        NULL AS CHINESE_DIAGNOSIS_NAME ,
        NULL AS CHINESE_SYNDROME_CODE ,
        '临床诊断' AS CHINESE_SYNDROME_NAME ,
        '2' AS DIAGNOSIS_BASIS_CODE ,
        GETDATE() AS CREATE_DATE ,
        GETDATE() AS UPDATE_DATE ,
        GETDATE() AS UPLOAD_TIME ,
        '1' AS ESTATUS
FROM    dbo.病案主页 A
        LEFT JOIN dbo.病人诊断记录 B ON A.病人ID = B.病人ID
                                  AND B.主页ID = A.主页ID
                                  AND B.记录来源 = 2
								  AND B.诊断类型=1
		LEFT JOIN dbo.疾病编码目录 B2 ON 
		CAST(B.疾病ID AS VARCHAR(30)) = CASE WHEN ISNUMERIC(B.疾病ID)=0 THEN  B2.编码 ELSE CAST(B2.ID AS VARCHAR(30)) END
        LEFT JOIN dbo.部门表 C ON A.出院科室ID = C.ID
		WHERE A.入院日期 BETWEEN @Date_from AND @date_to;
END TRY
BEGIN CATCH
INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
VALUES('入院诊断',ERROR_MESSAGE(),GETDATE())
END CATCH		
---2.3.2.	住院医嘱(HOSPITALIZED_ORDER)
BEGIN TRY
INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,CLINIC_DEPT_CODE,CLINIC_DEPT_NAME,ORDER_NUMBER,BUSINESS_LOCAL_ID,BUSINESS_LOCAL_NAME,
PATIENT_LOCAL_ID,INPATIENT_NO,VISIT_COUNT,ELECTRONIC_APP_NO,ORDER_INDICATION,ORDER_CATEGORY,ORDER_TYPE,MEDICAL_ORDER_TIME,MEDICAL_ORDER_DOCTOR_CODE,
MEDICAL_ORDER_DOCTOR_NAME,PLAN_START_TIME,PLAN_STOP_TIME,AUDIT_TIME,AUDITOR_NAME,CHECK_TIME,COLLATOR_NAME,EXECUTE_DEPARTMENT,EXECUTE_TIME,ORDER_EXECUTOR,
MEDICAL_ORDER_STOP_TIME,STOP_ADVICE_DOCTOR_CODE,STOP_ADVICE_DOCTOR_NAME,INTRAOPERATIVE_ORDER_MARK,INVALID_MARK,TYPE_CODE,DRUG_TYPE,INSUR_CODE,DRUG_ID,
DRUG_NAME,DRUG_SPECIFICATIONS,DRUG_PROCUREMENT_CODE,DRUG_DOSAGE_CODE,DRUG_DOSAGE_NAME,DRUG_USE_DOSE_ALL,DRUG_USE_DOSE,DRUG_USE_DOSE_UNIT,DRUG_USE_FREQUENCY_CODE,
DRUG_USE_FREQUENCY,DRUG_USE_ROUTE_CODE,DRUG_USE_ROUTE_NAME,ANTIBIOTIC_DETAIL_FLAG,ANTIBIOTIC_TYPE,TOXIC_PSYCHIATRIC_FLAG,HERBAL_FOOTNOTE,MEDICAL_ORDER,SKIN_TEST,
CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS FROM HOSPITALIZED_ORDER')
SELECT DISTINCT ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,
        B.编码 AS CLINIC_DEPT_CODE ,
        B.名称 AS CLINIC_DEPT_NAME ,
        CONCAT( A.ID , A.序号) AS ORDER_NUMBER ,
        A.ID AS BUSINESS_LOCAL_ID ,
        A.医嘱内容 AS BUSINESS_LOCAL_NAME ,
        CONCAT(( SELECT ZZJGDM
                 FROM   dbo.T_JGGL
               ), A.病人ID) AS PATIENT_LOCAL_ID ,
        C.住院号 AS INPATIENT_NO ,
        A.主页ID AS VISIT_COUNT ,
       '-' AS ELECTRONIC_APP_NO ,
        ISNULL(A.相关ID, A.ID) AS ORDER_INDICATION ,
        CASE A.医嘱期效
          WHEN 1 THEN 1
          ELSE 2
        END AS ORDER_CATEGORY ,
        CASE A.诊疗类别
          WHEN '5' THEN '11'
          WHEN '6' THEN '12'
          WHEN '7' THEN '13'
          WHEN 'E' THEN '21'
          WHEN 'C' THEN '22'
          WHEN 'D' THEN '23'
          WHEN 'F' THEN '24'
          WHEN 'G' THEN '25'
          WHEN 'H' THEN '26'
          WHEN 'I' THEN '27'
          WHEN 'K' THEN '28'
          ELSE CASE WHEN A.诊疗项目ID IN ( '71447', '72914', '71448' ) THEN '34'
                    WHEN A.诊疗项目ID IN ( '71449' ) THEN '32'
                    WHEN A.诊疗项目ID IN ( '71446', '71505' ) THEN '33'
                    WHEN A.诊疗项目ID IN ( '71533' ) THEN '37'
                    WHEN A.诊疗项目ID IN ( '-1' ) THEN '35'
                    WHEN A.诊疗项目ID IN ( '-1' ) THEN '36'
                    ELSE '31'
               END
        END AS ORDER_TYPE ,
        A.开嘱时间 AS MEDICAL_ORDER_TIME ,
        E.编号 AS MEDICAL_ORDER_DOCTOR_CODE ,
        E.姓名 AS MEDICAL_ORDER_DOCTOR_NAME ,
        '' AS PLAN_START_TIME ,
        '' AS PLAN_STOP_TIME ,
        A.校对时间 AS AUDIT_TIME ,
        A.校对护士 AS AUDITOR_NAME ,
        '' AS CHECK_TIME ,
        '' AS COLLATOR_NAME ,
        F.名称 AS EXECUTE_DEPARTMENT ,
        A.执行时间 AS EXECUTE_TIME ,
        A.执行人 AS ORDER_EXECUTOR ,
        A.停嘱时间 AS MEDICAL_ORDER_STOP_TIME ,
        H.编号 AS STOP_ADVICE_DOCTOR_CODE ,
        H.姓名 AS STOP_ADVICE_DOCTOR_NAME ,
        '' AS INTRAOPERATIVE_ORDER_MARK ,
        CASE A.医嘱状态
          WHEN '4' THEN '1'
          ELSE '2'
        END INVALID_MARK ,
        CASE WHEN A.诊疗类别 IN('5','6','7') THEN (SELECT dbo.F_药品大类2(L.名称)) END AS TYPE_CODE ,
        L.名称 AS DRUG_TYPE ,
        M.项目编码 AS INSUR_CODE ,
        N.编码  AS DRUG_ID ,
        N.名称  AS DRUG_NAME ,
        isnull(REPLACE(N.规格,' ',NULL),'-')  AS DRUG_SPECIFICATIONS ,
        '' AS DRUG_PROCUREMENT_CODE ,
        CASE WHEN A.诊疗类别 IN ( '5', '6', '7' )
             THEN CASE WHEN N.剂型 IN ( '片剂' ) THEN '01'
                       WHEN N.剂型 IN ( '胶囊(胶丸、滴丸)' ) THEN '20'
                       WHEN N.剂型 IN ( '丸剂' ) THEN '21'
                       WHEN N.剂型 IN ( '干混悬剂' ) THEN '71'
                       WHEN N.剂型 IN ( '颗粒剂' ) THEN '56'
                       WHEN N.剂型 IN ( '冲剂' ) THEN '54'
                       WHEN N.剂型 IN ( '粉剂(粉针剂)' ) THEN '15'
                       WHEN N.剂型 IN ( '溶液剂(注射剂)' ) THEN '16'
                       WHEN N.剂型 IN ( '口服液' ) THEN '31'
                       WHEN N.剂型 IN ( '酊剂' ) THEN '34'
                       ELSE '99'
                  END
             ELSE ''
        END AS DRUG_DOSAGE_CODE ,
        N.剂型 AS DRUG_DOSAGE_NAME ,
        A.总给予量 * K.剂量系数 AS DRUG_USE_DOSE_ALL ,
        A.单次用量 AS DRUG_USE_DOSE ,
        N.剂量单位 AS DRUG_USE_DOSE_UNIT ,
        CASE A.执行频次
          WHEN '每天二次' THEN '01'
          WHEN '每天四次' THEN '10'
          WHEN '每天一次' THEN '09'
          WHEN '每天上午一次' THEN '09'
          WHEN '隔日一次' THEN '11'
          WHEN '每周二次' THEN '02'
          WHEN '每周一次' THEN '12'
          WHEN '每小时一次' THEN '05'
          WHEN '每3小时一次' THEN '06'
          WHEN '每6小时一次' THEN '07'
          WHEN '每8小时一次' THEN '08'
          WHEN '每12小时一次' THEN '04'
          WHEN '每天晚上一次' THEN '03'
          WHEN '立即' THEN '13'
          ELSE '99'
        END AS DRUG_USE_FREQUENCY_CODE ,
        A.执行频次 AS DRUG_USE_FREQUENCY ,
        CASE WHEN A.用法 IN ( '口服', '开水冲服' ) THEN '1'
             WHEN A.用法 IN ( '肛门注入' ) THEN '2'
             WHEN A.用法 IN ( '舌下含化' ) THEN '3'
             WHEN A.用法 IN ( '蛛网膜下腔给药', '硬膜外给药', '羊膜腔内注射', '宫颈注射', '宫体注射' )
             THEN '4'
             WHEN A.用法 IN ( '皮下注射' ) THEN '401'
             WHEN A.用法 IN ( '皮内注射' ) THEN '402'
             WHEN A.用法 IN ( '肌肉注射' ) THEN '403'
             WHEN A.用法 IN ( '静脉注射', '静脉滴注' ) THEN '404'
             WHEN A.用法 IN ( '喷雾吸入', '吸入' ) THEN '5'
             WHEN A.用法 IN ( '置阴道内', '阴道冲洗' ) THEN '605'
             WHEN A.用法 IN ( '气管吸入' ) THEN '606'
             WHEN A.用法 IN ( '滴眼' ) THEN '607'
             WHEN A.用法 IN ( '滴鼻' ) THEN '608'
             WHEN A.用法 IN ( '外敷' ) THEN '611'
             WHEN A.用法 IN ( '外搽' ) THEN '612'
             ELSE '9'
        END AS DRUG_USE_ROUTE_CODE ,
        A.用法 AS DRUG_USE_ROUTE_NAME ,
        CASE WHEN ISNULL(O.抗生素, 0) <> 0
                  AND A.诊疗类别 = '5' THEN 1
             ELSE 0
        END AS ANTIBIOTIC_DETAIL_FLAG ,
        2 AS ANTIBIOTIC_TYPE ,
        CASE WHEN O.毒理分类 IN ( '普通药' ) THEN '0'
             WHEN O.毒理分类 IN ( '精神II类', '精神I类' ) THEN '2'
             WHEN O.毒理分类 IN ( '毒性药' ) THEN '3'
             WHEN O.毒理分类 IN ( '麻醉药' ) THEN '1'
             ELSE ''
        END TOXIC_PSYCHIATRIC_FLAG ,
        '' AS HERBAL_FOOTNOTE ,
        A.医生嘱托 AS MEDICAL_ORDER ,
        CASE WHEN A.皮试结果 IS NULL THEN 2
             ELSE 1
        END AS SKIN_TEST ,
        A.开嘱时间 AS CREATE_DATE ,
        A.开嘱时间 AS UPDATE_DATE ,
        GETDATE() AS UPLOAD_TIME ,
        '1' AS ESTATUS
FROM    dbo.病人医嘱记录 A
        LEFT JOIN dbo.部门表 B ON A.病人科室ID = B.ID
        LEFT JOIN dbo.病案主页 C ON C.主页ID = A.主页ID
                                AND C.病人ID = A.病人ID
        LEFT JOIN dbo.住院费用记录 D ON A.ID = D.医嘱序号
        LEFT JOIN dbo.人员表 E ON
		 CASE  WHEN CHARINDEX('/',A.开嘱医生)=0 THEN A.开嘱医生 ELSE DBO.SubStr(A.开嘱医生, CHARINDEX('/',A.开嘱医生)+1)   END = E.姓名
        LEFT JOIN dbo.部门表 F ON A.执行科室ID = F.ID
        LEFT JOIN dbo.人员表 H ON A.停嘱医生 = H.姓名
     
        LEFT JOIN dbo.药品规格 K ON A.诊疗项目ID = K.药品ID
        LEFT JOIN dbo.诊疗项目目录 J ON K.药名ID = J.ID
        LEFT JOIN dbo.药品特性 O ON J.ID = O.药名ID
                                AND ISNULL(O.抗生素, 0) <> 0
        LEFT JOIN dbo.诊疗分类目录 L ON J.分类ID = L.ID
        LEFT JOIN dbo.保险支付项目 M ON A.诊疗项目ID = M.收费细目ID
                                  AND M.险类 = 3,
								     dbo.收费项目目录 N 
WHERE   A.诊疗项目ID = N.ID AND  A.开嘱时间 BETWEEN @Date_from AND @date_to
        AND A.病人来源=2
        AND ISNULL(A.屏蔽打印, 0) = 0
        AND A.医嘱状态 <> -1
		AND C.住院号 IS Not NULL
END TRY
BEGIN CATCH
INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
VALUES('住院医嘱',ERROR_MESSAGE(),GETDATE())
END CATCH
---2.3.4.	住院费用明细(HOSPITALIZED_EXPSET_DETAIL)
BEGIN TRY
INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,CLINIC_DEPT_CODE,CLINIC_DEPT_NAME,PATIENT_LOCAL_ID,HOSPITALIZATION_NO,VISIT_COUNT,
BUSINESS_LOCAL_ID,PRESCRIBE_LOCAL_ID,MEDICAL_ORDER_DETAIL_NO,TRANSACATION_TYPE,REFUND_TIME,REFUND_LABEL,INSUR_CODE,DRUG_ID,DRUG_NAME,DRUG_SPECIFICATIONS,
DRUG_PROCUREMENT_CODE,DRUGS_NUMBER,DRUGS_UNIT,CHARGE_ITEM_CATEGORY,UNIT_PRICE,NUMBER_AMOUNT,SUM_MONEY,SEL_PAY_AMOUNT,REIMBURSEMENT_AMOUNT,COST_CATEGORY,
CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS  FROM HOSPITALIZED_EXPSET_DETAIL')
SELECT  ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,
        B.编码 AS CLINIC_DEPT_CODE ,
        B.名称 AS CLINIC_DEPT_NAME ,
		 CONCAT(( SELECT ZZJGDM
                 FROM   dbo.T_JGGL
               ), A.病人ID) AS PATIENT_LOCAL_ID ,
        A.标识号 AS HOSPITALIZATION_NO,
		A.主页ID AS VISIT_COUNT,
		A.ID AS BUSINESS_LOCAL_ID,
		A.结帐ID AS PRESCRIBE_LOCAL_ID,
		ISNULL(A.医嘱序号,A.ID)  AS MEDICAL_ORDER_DETAIL_NO,
		CASE WHEN A.记录状态 %3=2 THEN 2 ELSE 1 END TRANSACATION_TYPE,
		C.收费时间  AS REFUND_TIME,
		CASE WHEN A.记录状态 %3=2 THEN 2 ELSE
		CASE WHEN A.记录状态= 1 THEN 1 ELSE 3 END  END AS REFUND_LABEL,
		D.项目编码 AS INSUR_CODE,
		 E.编码  AS DRUG_ID,
		 E.名称  AS  DRUG_NAME,
		ISNULL(REPLACE(E.规格,' ',NULL),'-')  AS DRUG_SPECIFICATIONS,
		'' AS DRUG_PROCUREMENT_CODE,
		CASE WHEN A.收费类别 IN('5','6','7') THEN CAST(A.付数*A.数次 AS VARCHAR(10)) ELSE '' END  AS DRUGS_NUMBER,
	    CASE WHEN A.收费类别 IN('5','6','7') THEN E.计算单位 ELSE '' END	 AS DRUGS_UNIT,
		CASE 
		WHEN A.收据费目 IN( 'B超','阴道镜','心电图','检查费') THEN '8'
		WHEN A.收据费目 IN( '西药费') THEN '2'
	    WHEN A.收据费目 IN( '中成药') THEN '3'
		WHEN A.收据费目 IN( '床位费') THEN '6'
		WHEN A.收据费目 IN( '护理费') THEN '11'
		WHEN A.收据费目 IN( '麻醉费') THEN '15'
		WHEN A.收据费目 IN( '手术费') THEN '12'
		WHEN A.收据费目 IN( '输血费') THEN '14'
		WHEN A.收据费目 IN( '化验费') THEN '13'
		WHEN A.收据费目 IN( '诊查费') THEN '21'
		WHEN A.收据费目 IN( '治疗费') THEN '9' ELSE '99' END AS CHARGE_ITEM_CATEGORY,
		A.标准单价 AS UNIT_PRICE,
		A.数次 AS NUMBER_AMOUNT,
		A.结帐金额 AS SUM_MONEY,
		A.结帐金额 AS SEL_PAY_AMOUNT, 
		0.000 AS REIMBURSEMENT_AMOUNT,
		A.收据费目 AS COST_CATEGORY,
		A.登记时间 AS CREATE_DATE ,
        A.登记时间 AS UPDATE_DATE ,
        GETDATE()  AS UPLOAD_TIME ,
        '1' AS ESTATUS
		FROM dbo.住院费用记录 A 
		LEFT JOIN dbo.部门表 B ON A.病人病区ID=B.ID
		LEFT JOIN dbo.保险支付项目 D ON D.收费细目ID = A.收费细目ID AND D.险类=3,
		dbo.病人结帐记录 C ,
		dbo.收费项目目录 E 
		WHERE A. 结帐ID=C.ID AND  A.收费细目ID=E.ID
		AND A.登记时间  BETWEEN  @Date_from AND @date_to
		AND A.结帐ID IS NOT NULL
		AND A.记录性质=2
END TRY
BEGIN CATCH
INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
VALUES('住院费用明细',ERROR_MESSAGE(),GETDATE())
END CATCH
---2.3.5.	住院结算(HOSPITALIZED_SETTLEMENT)
BEGIN TRY
INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,CLINIC_DEPT_CODE,CLINIC_DEPT_NAME,BUSINESS_LOCAL_ID,NUMBER_N,PATIENT_LOCAL_ID,INPATIENT_NO,
VISIT_COUNT,PATIENT_TYPE,PATIENT_TYPE_NAME,TRANSACATION_TYPE,REFUND_FLAG,MODIFY_FLAG,INVOICE_NUMBER,CHARGE_FLAG,IDENTITY_CATEGORY_CODE,IDENTITY_NUMBER,NAME,
INSURANCE_TYPE,MEDICAL_PAYMENT_METHOD,MEDICAL_PAYMENT_METHOD_ID,CHARGE_TIME,REFUND_TIME,TOTAL_SUM,AMOUNT_RECEIVED,MEDICAL_INSURANCE_AMOUNT,
MEDICAL_INSURANCE_PAY_AMOUNT,SELF_EXPENSES_AMOUNT,DISCOUNT_AMOUNT,SELF_PAY_AMOUNT_OUT,SELF_PAY_AMOUNT_IN,FUND_PAY_AMOUNT,INPATIENT_COST_SUM,
WESTERN_MEDICINE_FEE,CHINESE_PATENT_DRUG_FEE,CHINESE_HERBAL_MEDICINE_FEE,REGISTRATION_FEE,BED_FEE,DIAGNOSTIC_FEE,INSPECTION_FEE,TREATMENT_FEE,
SURGICAL_MATERIAL_FEE,NURSING_FEE,OPERATION_FEE,LABORATORY_FEE,BLOOD_TRANSFUSION_FEE,ANESTHESIA_COST,RADIOLOGICAL_FEE,OXYGEN_SUPPLY_FEE,DELIVERING_BABY_FEE,
INFANT_FEE,ACCOMPANYING_BED_FEE,CONSULTATION_FEE,SPECIAL_SERVICE_FEE,OTHER_FEE,INSPECTION_MATERIAL_FEE,THERAPEUTIC_MATERIALS_FEE,MEDICINE_SERVICE_FEE,
CHARGE_OPERATOR_NUMBER,CHARGE_OPERATOR_NAME,CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS FROM HOSPITALIZED_SETTLEMENT')
SELECT  ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,
        C.编码 AS CLINIC_DEPT_CODE ,
        C.名称 AS CLINIC_DEPT_NAME ,
        A.ID AS BUSINESS_LOCAL_ID ,
        CASE WHEN A.记录状态 % 3 = 0 THEN A.记录状态 / 3 + 1
             ELSE 1
        END AS NUMBER_N ,
        CONCAT(( SELECT ZZJGDM
                 FROM   dbo.T_JGGL
               ), A.病人ID) AS PATIENT_LOCAL_ID ,
        B.住院号 AS INPATIENT_NO ,
        A.主页ID AS VISIT_COUNT ,
        '3' AS PATIENT_TYPE ,
        '住院' AS PATIENT_TYPE_NAME ,
        CASE WHEN A.记录状态 % 3 = 2 THEN 2
             ELSE 1
        END AS TRANSACATION_TYPE ,
        CASE WHEN A.记录状态 % 3 = 2 THEN 2
             ELSE CASE WHEN A.记录状态 = 1 THEN 1
                       ELSE 3
                  END
        END AS REFUND_FLAG ,
        '2' AS MODIFY_FLAG ,
        A.实际票号 AS INVOICE_NUMBER ,
        '0' AS CHARGE_FLAG ,
        CASE  WHEN D.身份证 IS NULL THEN NULL ELSE  '01' END AS IDENTITY_CATEGORY_CODE ,
        D.身份证 AS IDENTITY_NUMBER ,
        D.姓名 AS NAME ,
        ISNULL(CASE O.险类
          WHEN '1' THEN '03'
          WHEN '2' THEN '03'
          WHEN '3' THEN '02'
          ELSE '07'
        END,'07') AS INSURANCE_TYPE ,
        '01' AS MEDICAL_PAYMENT_METHOD ,
        '' AS MEDICAL_PAYMENT_METHOD_ID ,
        CASE WHEN A.记录状态 IN(
           1,3) THEN A.收费时间
        END AS CHARGE_TIME ,
        CASE A.记录状态
          WHEN 2 THEN A.收费时间
        END AS REFUND_TIME ,
        F.住院费 AS TOTAL_SUM ,
        F.住院费 AS AMOUNT_RECEIVED ,
        ISNULL(O.进入统筹金额, 0.000) AS MEDICAL_INSURANCE_AMOUNT ,
        ISNULL(O.统筹报销金额, 0.000) AS MEDICAL_INSURANCE_PAY_AMOUNT ,
        ISNULL(O.首先自付金额, 0.000) AS SELF_EXPENSES_AMOUNT ,
        0.000 AS DISCOUNT_AMOUNT ,
        0.000 AS SELF_PAY_AMOUNT_OUT ,
        0.000 AS SELF_PAY_AMOUNT_IN ,
        0.000 AS FUND_PAY_AMOUNT ,
        F.住院费 AS INPATIENT_COST_SUM ,
        ISNULL(F.西药费, 0.000) AS WESTERN_MEDICINE_FEE ,
        ISNULL(F.中成药费, 0.000) AS CHINESE_PATENT_DRUG_FEE ,
        ISNULL(F.中草药费, 0.000) AS CHINESE_HERBAL_MEDICINE_FEE ,
        ISNULL(F.挂号费, 0.000) AS REGISTRATION_FEE ,
        ISNULL(F.床位费, 0.000) AS BED_FEE ,
        ISNULL(F.诊察费, 0.000) AS DIAGNOSTIC_FEE ,
        ISNULL(F.检查费, 0.000) AS INSPECTION_FEE ,
        ISNULL(F.治疗费, 0.000) AS TREATMENT_FEE ,
        ISNULL(F.手术材料费, 0.000) AS SURGICAL_MATERIAL_FEE ,
        ISNULL(F.护理费, 0.000) AS NURSING_FEE ,
        ISNULL(F.手术费, 0.000) AS OPERATION_FEE ,
        ISNULL(F.化验费, 0.000) AS LABORATORY_FEE ,
        ISNULL(F.输血费, 0.000) AS BLOOD_TRANSFUSION_FEE ,
        ISNULL(F.麻醉费, 0.000) AS ANESTHESIA_COST ,
		0.000 AS RADIOLOGICAL_FEE,
        ISNULL(F.输氧费, 0.000) AS OXYGEN_SUPPLY_FEE ,
        ISNULL(F.接生费, 0.000) AS DELIVERING_BABY_FEE ,
        ISNULL(Y.金额, 0.000) AS INFANT_FEE ,
        ISNULL(F.陪床费, 0.000) AS ACCOMPANYING_BED_FEE ,
        ISNULL(F.诊疗费, 0.000) AS CONSULTATION_FEE ,
        ISNULL(F.特需服务费, 0.000) AS SPECIAL_SERVICE_FEE ,
        ISNULL(F.其他费, 0.000) AS OTHER_FEE ,
        ISNULL(F.检查用材料费, 0.000) AS INSPECTION_MATERIAL_FEE ,
        ISNULL(F.治疗用材料费, 0.000) AS THERAPEUTIC_MATERIALS_FEE ,
        ISNULL(F.药事服务费, 0.000) AS MEDICINE_SERVICE_FEE ,
        W.GH AS CHARGE_OPERATOR_NUMBER ,
        A.操作员姓名 AS CHARGE_OPERATOR_NAME ,
        A.收费时间 AS CREATE_DATE ,
        A.收费时间 AS UPDATE_DATE ,
        GETDATE() AS UPLOAD_TIME ,
        '1' AS ESTATUS
FROM    dbo.病案主页 B
        LEFT JOIN dbo.部门表 C ON B.出院科室ID = C.ID ,
        dbo.病人结帐记录 A
        LEFT JOIN 病人信息 D ON A.病人ID = D.ID
        LEFT JOIN dbo.T_UserDB W ON A.操作员姓名 = W.XM
        LEFT JOIN dbo.保险结算记录 O ON O.记录ID = A.ID 
        LEFT JOIN ( SELECT  H.病人ID ,
                            H.主页ID ,H.结帐ID,
                            SUM(H.金额) AS '住院费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '西药费' ) THEN H.金额
                                END) AS '西药费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '中成药' ) THEN H.金额
                                END) AS '中成药费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '中草药' ) THEN H.金额
                                END) AS '中草药费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '挂号费' ) THEN H.金额
                                END) AS '挂号费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '床位费' ) THEN H.金额
                                END) AS '床位费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '诊查费' ) THEN H.金额
                                END) AS '诊察费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '检查费' ) THEN H.金额
                                END) AS '检查费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '治疗费' ) THEN H.金额
                                END) AS '治疗费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '材料费' ) THEN H.金额
                                END) AS '手术材料费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '护理费' ) THEN H.金额
                                END) AS '护理费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '手术费' ) THEN H.金额
                                END) AS '手术费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '化验费' ) THEN H.金额
                                END) AS '化验费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '输血费' ) THEN H.金额
                                END) AS '输血费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '麻醉费' ) THEN H.金额
                                END) AS '麻醉费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '-1' ) THEN H.金额
                                END) AS '输氧费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '-1' ) THEN H.金额
                                END) AS '接生费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '-1' ) THEN H.金额
                                END) AS '婴儿费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '-1' ) THEN H.金额
                                END) AS '陪床费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '-1' ) THEN H.金额
                                END) AS '诊疗费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '-1' ) THEN H.金额
                                END) AS '特需服务费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '其他费' ) THEN H.金额
                                END) AS '其他费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '-1' ) THEN H.金额
                                END) AS '检查用材料费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '-1' ) THEN H.金额
                                END) AS '治疗用材料费' ,
                            MAX(CASE WHEN H.收入项目 IN ( '-1' ) THEN H.金额
                                END) AS '药事服务费'
                    FROM    ( SELECT    X.病人ID ,X.结帐ID,
                                        X.主页ID ,
                                        Z.名称 AS 收入项目 ,
                                        SUM(结帐金额) AS 金额
                              FROM      dbo.住院费用记录 X
                                        LEFT JOIN dbo.收入项目 Z ON X.收入项目ID = Z.ID
                              WHERE     EXISTS ( SELECT *
                                                 FROM   dbo.病人结帐记录 Y
                                                 WHERE  X.结帐ID = Y.ID
                                                        AND Y.收费时间 BETWEEN @Date_from AND @Date_to )
														AND X.婴儿费=0
                              GROUP BY  X.病人ID ,X.结帐ID,
                                        X.主页ID ,
                                        Z.名称
                            ) H
                    GROUP BY H.病人ID ,
                            H.主页ID,H.结帐ID
                  ) F ON F.主页ID = A.主页ID
                         AND F.病人ID = A.病人ID   AND A.ID=F.结帐ID
		LEFT JOIN ( SELECT  X.病人ID ,X.结帐ID,
                X.主页ID ,
                SUM(结帐金额) AS 金额
        FROM    dbo.住院费用记录 X
                LEFT JOIN dbo.收入项目 Z ON X.收入项目ID = Z.ID
        WHERE   EXISTS ( SELECT *
                         FROM   dbo.病人结帐记录 Y
                         WHERE  X.结帐ID = Y.ID
                                AND Y.收费时间 BETWEEN @Date_from AND @Date_to   )
                AND X.婴儿费 <> 0
        GROUP BY X.病人ID ,X.结帐ID,
                X.主页ID ) Y ON Y.主页ID = A.主页ID
                         AND Y.病人ID = A.病人ID  AND A.ID=Y.结帐ID
WHERE   B.主页ID = A.主页ID
        AND B.病人ID = A.病人ID and A.实际票号 IS NOT NULL
        AND A.收费时间 BETWEEN @Date_from AND @Date_to 
		AND A.ID  IN
		(
         SELECT DISTINCT X.结帐ID 
         FROM   dbo.住院费用记录 X
         WHERE  EXISTS ( SELECT *
                         FROM   dbo.病人结帐记录 Y
                         WHERE  X.结帐ID = Y.ID
                                AND Y.收费时间 BETWEEN @Date_from AND @Date_to   )
								AND X.婴儿费=0
		)	
END TRY
BEGIN CATCH
INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
VALUES('住院结算',ERROR_MESSAGE(),GETDATE())
END CATCH
---2.3.6.	出院小结(DISCHARGE_ABSTRACT)
BEGIN TRY
INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,CLINIC_DEPT_CODE,CLINIC_DEPT_NAME,PATIENT_LOCAL_ID,BUSINESS_LOCAL_ID,MEDICAL_RECORD_NO,INPATIENT_NO,
VISIT_COUNT,WARD_NAME,WARD_NUM,BED_NUM,INHOS_DATE,NAME,GENDER,GENDER_NAME,AGE_YEAR,AGE_MONTH,IDCARD_FLAG,HEALTH_FILE_NO,MARRIAGE_CODE,MARRIAGE_NAME,PHONE_NO,CONTACT_NAME,
CONTACT_PHONE,INHOS_STATE,DIAGNOSIS_NO_IN,DISEASE_NO_IN,SYNDROME_NO_IN,DIAGNOSIS_NO_OUT,DISEASE_NO_OUT,SYNDROME_NO_OUT,OPERATION_NO,OPERATION_TIME,ANAESTHESIA_NO,
OPERATION_PROCESS,NOTCH_LEVEL,HEALING_LEVEL,THERAPEUTIC_THERAPY,THERAPEUTIC_THERAPY_NAME,CHINA_FOUR_DIAG_OBSER,POSITIVE_TEST_RESULTS,CH_MEDICINE_DECOCTION,
CHINESE_MEDICINE_TREAT_METHOD,TREATMENT_PROCESS_DESC,DISEASE_OUTCOME_CODE,DISEASE_OUTCOME_NAME,OUTHOS_STATE,OUTHOS_SYMPTOMS_SIGNS,OUTHOS_ADVIC,OUTHOS_DATE,
ACTUAL_HOSPITAL_STAY,ADMISSION_DOCTOR_SIG,ADMISSION_SIG_DATETIME,SUP_DOCTOR_SIG,SIGNATURE_DATETIME,CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS
 FROM DISCHARGE_ABSTRACT')
SELECT DISTINCT
        ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,
        C.编码 AS CLINIC_DEPT_CODE ,
        C.名称 AS CLINIC_DEPT_NAME ,
        CONCAT(( SELECT ZZJGDM
                 FROM   dbo.T_JGGL
               ), A.PatientID) AS PATIENT_LOCAL_ID ,
        CONCAT(A.住院号, A.主页ID) AS BUSINESS_LOCAL_ID ,
        A.病案号 AS MEDICAL_RECORD_NO ,
        A.住院号 AS INPATIENT_NO ,
        A.主页ID AS VISIT_COUNT ,
        D.名称 AS WARD_NAME ,
        A.出院病房 AS WARD_NUM ,
        B.出院病床 AS BED_NUM ,
        A.入院时间 AS INHOS_DATE ,
        A.姓名 AS NAME ,
        CASE A.性别
          WHEN '男' THEN '1'
          WHEN '女' THEN '2'
          WHEN '未知' THEN '0'
          ELSE '9'
        END AS GENDER ,
        A.性别 AS GENDER_NAME ,
       CASE WHEN CHARINDEX('岁',A.年龄)<>0 THEN 
		REPLACE(REPLACE(A.年龄,'岁',''),'月','') ELSE '0'
		 END  AS AGE_YEAR,
		CASE WHEN CHARINDEX('岁',A.年龄)=0 THEN
		CASE WHEN CHARINDEX('月',A.年龄)=0 THEN
		'0'
		ELSE 
		CASE WHEN CHARINDEX('月',A.年龄)<>0 AND  CHARINDEX('天',A.年龄)<>0 THEN
		CONCAT(SUBSTRING(A.年龄,1,CHARINDEX('月',A.年龄)-1),SUBSTRING(A.年龄,CHARINDEX('月',A.年龄)+1,CHARINDEX('天',A.年龄)-CHARINDEX('月',A.年龄)-1),'/',30)
		ELSE
		SUBSTRING(A.年龄,1,CHARINDEX('月',A.年龄)-1) END
		END END  AS AGE_MONTH,
        A.身份证号 AS IDCARD_FLAG ,
        A.健康卡号 AS HEALTH_FILE_NO ,
        CASE A.婚姻状况
          WHEN '未婚' THEN '1'
          WHEN '已婚' THEN '2'
          WHEN '丧偶' THEN '3'
          WHEN '离婚' THEN '4'
          ELSE '9'
        END AS MARRIAGE_CODE ,
        A.婚姻状况 AS MARRIAGE_NAME ,
        A.电话 AS PHONE_NO ,
        A.联系人 AS CONTACT_NAME ,
        A.联系人电话 AS CONTACT_PHONE ,
        '-' AS INHOS_STATE ,
        '-' AS DIAGNOSIS_NO_IN ,
        '-' AS DISEASE_NO_IN ,
        '-' AS SYNDROME_NO_IN ,
        ISNULL(X.疾病编码, '-') AS DIAGNOSIS_NO_OUT ,
        '-' AS DISEASE_NO_OUT ,
        '-' AS SYNDROME_NO_OUT ,
        ( SELECT    data = STUFF(( SELECT   '|' + [t].[手术编码]
                                   FROM     手术记录 t
                                   WHERE    PatientID = t1.PatientID
                                            AND 主页ID = t1.主页ID
                                 FOR
                                   XML PATH('')
                                 ), 1, 1, '')
          FROM      手术记录 t1
          WHERE     t1.PatientID = B.病人ID
                    AND t1.主页ID = B.主页ID
          GROUP BY  PatientID ,
                    t1.主页ID
        ) AS OPERATION_NO ,
        (SELECT dbo.F_手术日期(b.病人ID,b.主页ID))  AS OPERATION_TIME ,
        (select dbo.F_接口麻醉方式( E.麻醉方式编号,1)) AS ANAESTHESIA_NO ,
        '' AS OPERATION_PROCESS ,
        '' AS NOTCH_LEVEL ,
       (select dbo.F_接口麻醉方式( E.愈合编码,2))  AS HEALING_LEVEL ,
        '' AS THERAPEUTIC_THERAPY ,
        '' AS THERAPEUTIC_THERAPY_NAME ,
        '' AS CHINA_FOUR_DIAG_OBSER ,
        '' AS POSITIVE_TEST_RESULTS ,
        '' AS CH_MEDICINE_DECOCTION ,
        '' AS CHINESE_MEDICINE_TREAT_METHOD ,
        '' AS TREATMENT_PROCESS_DESC ,
        CASE F.出院情况
          WHEN '治愈' THEN '1'
          WHEN '好转' THEN '2'
          WHEN '稳定' THEN '3'
          WHEN '恶化' THEN '4'
          WHEN '死亡' THEN '5'
          ELSE '9'
        END AS DISEASE_OUTCOME_CODE ,
        ISNULL(F.出院情况, '其他') AS DISEASE_OUTCOME_NAME ,
        '-' AS OUTHOS_STATE ,
        '-' AS OUTHOS_SYMPTOMS_SIGNS ,
        '-' AS OUTHOS_ADVIC ,
        B.出院日期 AS OUTHOS_DATE ,
        B.住院天数 AS ACTUAL_HOSPITAL_STAY ,
        isnull(B.住院医师,'-') AS ADMISSION_DOCTOR_SIG ,
        b.出院日期 AS ADMISSION_SIG_DATETIME ,
        ISNULL(( SELECT TOP 1
                    姓名
          FROM      人员表
          WHERE     id = I.上级医师ID
        ),'-') AS SUP_DOCTOR_SIG ,
       b.出院日期  AS SIGNATURE_DATETIME ,
        A.登记时间 AS CREATE_DATE ,
        A.登记时间 AS UPDATE_DATE ,
        GETDATE() AS UPLOAD_TIME ,
        '1' AS ESTATUS
FROM    T_病案信息 A ,
        病案主页 B
        LEFT JOIN 部门表 C ON B.出院科室ID = C.ID
        LEFT JOIN 部门表 D ON B.当前病区ID = D.ID
        LEFT JOIN 手术记录 E ON B.病人ID = E.PatientID
                            AND E.主页ID = B.主页ID
        LEFT JOIN 病人诊断记录 F ON B.病人ID = F.病人ID
                              AND B.主页ID = F.主页ID
                              AND F.诊断类型 = '3'
        LEFT JOIN 出院诊断 X ON B.病人ID = X.PatientID
                            AND B.主页ID = X.主页ID
                            AND X.诊断类别 = '0'
                            AND X.诊断类型 = '3'
        LEFT JOIN 人员表 H ON B.住院医师 = H.姓名
        LEFT JOIN ( SELECT  M.id ,
                            M.上级医师ID
                    FROM    ( SELECT    ROW_NUMBER() OVER ( PARTITION BY ID ORDER BY id ,上级医师ID desc) AS rn ,
                                        ID ,
                                        上级医师ID
                              FROM      上级医师
                            ) M
                    WHERE   M.rn = 1
                  ) I ON H.ID = I.id
WHERE   A.PatientID = B.病人ID
        AND A.主页ID = B.主页ID
		and B.出院日期 IS NOT NULL
		AND A.登记时间 between @Date_from and @date_to;
END TRY
BEGIN CATCH
INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
VALUES('出院小结',ERROR_MESSAGE(),GETDATE())
END CATCH
---2.3.7.	住院病案首页(INPATIENT_MEDICAL_RECORD)
BEGIN TRY
INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,BUSINESS_LOCAL_ID,PATIENT_LOCAL_ID,CLINIC_DEPT_CODE,CLINIC_DEPT_NAME,A48,
INPATIENT_NO,A49,B12,B15,A47,A46C,A11,A12C,A13,A14,A15C,A21C,A38C,A19C,A20,A22,A23C,A24,A25C,A26,A27,A28C,A29,A30,A31C,A32,A33C,A34,A35,B11C,
B13C,B14,B21C,B16C,B17,B20,C01C,C02N,C03C,C04N,C05C,C06x01C,C07x01N,C08x01C,C06x02C,C07x02N,C08x02C,C06x03C,C07x03N,C08x03C,C06x04C,C07x04N,
C08x04C,C06x05C,C07x05N,C08x05C,C06x06C,C07x06N,C08x06C,C06x07C,C07x07N,C08x07C,C06x08C,C07x08N,C08x08C,C09C,C10N,C11,C12C,C13N,C24C,C25,B22,
B23,B24,B25,B26,B27,B28,B29,B30C,B31,B32,B33,C34C,C26C,C27C,C14x01C,C15x01N,C16x01,C17x01,C18x01,C19x01,C20x01,C21x01C,C22x01C,C23x01,C35x01C,
C36x01N,C37x01,C38x01,C39x01,C40x01,C41x01,C42x01C,C43x01C,C44x01,C35x02C,C36x02N,C37x02,C38x02,C39x02,C40x02,C41x02,C42x02C,C43x02C,C44x02,
C35x03C,C36x03N,C37x03,C38x03,C39x03,C40x03,C41x03,C42x03C,C43x03C,C44x03,C35x04C,C36x04N,C37x04,C38x04,C39x04,C40x04,C41x04,C42x04C,C43x04C,
C44x04,C35x05C,C36x05N,C37x05,C38x05,C39x05,C40x05,C41x05,C42x05C,C43x05C,C44x05,A16,A18x01,A18x02,A18x03,A18x04,A18x05,A17,C28,C29,C30,C31,C32,
C33,B36C,B37,B34C,B35,D01,D09,D11,D12,D13,D14,D15,D16,D17,D18,D19,D19x01,D20,D20x01,D20x02,D21,D22,D23,D23x01,D24,D25,D26,D27,D28,D29,D30,D31,
D32,D33,D34,CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS FROM INPATIENT_MEDICAL_RECORD')
SELECT DISTINCT
        ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,
		A.ID AS BUSINESS_LOCAL_ID,
		CONCAT(( SELECT ZZJGDM
                 FROM   dbo.T_JGGL
               ), A.PatientID) AS PATIENT_LOCAL_ID ,
        C.编码 AS CLINIC_DEPT_CODE ,
        C.名称 AS CLINIC_DEPT_NAME ,
        A.病案号 AS A48,
		A.住院号 AS INPATIENT_NO,
        A.主页ID AS A49 ,
		B.入院日期 AS B12,
		B.出院日期 AS B15,
		A.健康卡号 AS A47,
		CASE ISNULL(B.医疗付款方式,'07') WHEN '城乡居民医疗保险'THEN '90'
		WHEN '城镇职工医疗保险'THEN '01'
		WHEN '新型农村合作医疗'THEN '03'
		WHEN '全自费'THEN '07'
		WHEN '全公费'THEN '06'
		WHEN '健康扶贫'THEN '04'
		WHEN '商业医疗保险'THEN '05'
		WHEN '其他社会保险'THEN '02'
		ELSE  '99'END AS A46C,
		A.姓名 AS A11,
		CASE A.性别
          WHEN '男' THEN '1'
          WHEN '女' THEN '2'
          WHEN '未知' THEN '0'
          ELSE '9'
        END AS A12C ,
		A.出生日期 AS A13,
	    CASE WHEN DATEDIFF(MONTH, A.出生日期,b.入院日期)/12>=12 THEN  DATEDIFF(MONTH, A.出生日期,b.入院日期)/12 ELSE 0 END  AS  A14,
		ISNULL(A.国籍,'中国')  AS A15C,
		CASE ISNULL(A.婚姻状况,'9')
          WHEN '未婚' THEN '1'
          WHEN '已婚' THEN '2' 
          WHEN '丧偶' THEN '3'
          WHEN '离婚' THEN '4'
          ELSE '9'
        END A21C,
		CASE ISNULL(B.职业,'90') WHEN '国家机关、党群组织、企业、事业单位负责人' THEN '11' 
		 WHEN '农民' THEN '27'  WHEN '专业技术人员' THEN '13' 
		 WHEN '教师' THEN '71'  WHEN '商业、服务业人员' THEN '51' 
		 WHEN '学生' THEN '31'  WHEN '军人' THEN '37'  
		 WHEN '工人' THEN '1'  
		 ELSE '90' END A38C,
		CAST(R.编码 AS INT) AS A19C,
		A.身份证号 AS A20,
		isNull(A.出生地,'-') AS  A22,
		'24' AS A23C,
		isNull(A.户口地址,'-') AS A24,
		isNull(A.户口邮编,'-') AS A25C,
		isNull(O.现住址,'-') AS A26,
		isNull(A.电话,'-') AS A27,
		isNull(O.邮编,'-') AS A28C,
		CONCAT(isNull(A.单位,'-'),A.单位地址) AS A29,
		isNull(A.单位电话,'-') AS A30,
		isNull(A.单位邮编,'-') AS A31C,
		isNull(A.联系人,'-') AS A32,
		CASE ISNULL(B.与患者关系,'9') WHEN '配偶' THEN '1' 
		 WHEN '父母' THEN '5'  WHEN '父女' THEN '3'   WHEN '母女' THEN '3'  WHEN '母子' THEN '2' 
		 WHEN '父子' THEN '2'  WHEN '祖孙' THEN '4' 
		 WHEN '兄弟' THEN '7'  WHEN '姐妹' THEN '7'   
		 ELSE '9' END A33C,
		isNull(B.联系人地址,'-') AS A34,
		isNull(A.联系人电话,'-') AS A35,
		isNull(A.入院途径,'2') AS B11C,
		M0.工作性质 AS B13C,
		A.出院病房 AS B14,
		ISNULL(M4.工作性质,'79')  AS B21C,
		M3.工作性质 AS B16C,
		A.出院病房 as B17,
		A.住院天数 AS B20,
		A.疾病编码 AS C01C,
		M1.名称 AS C02N,
		X.疾病编码 AS C03C,
		M2.名称 AS C04N,
		ISNULL(X.入院病情编号,'1') AS C05C,
		CAST((SELECT 诊断 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,1)) AS VARCHAR(20)) C06x01C,
		(SELECT 编码 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,1)) AS C07x01N,
		(SELECT 病情 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,1)) AS C08x01C,

		CAST((SELECT 诊断 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,2)) AS VARCHAR(20)) C06x02C,
		(SELECT 编码 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,2)) AS C07x02N,
		(SELECT 病情 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,2)) AS C08x02C,

		CAST((SELECT 诊断 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,3)) AS VARCHAR(20)) C06x03C,
		(SELECT 编码 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,3)) AS C07x03N,
		(SELECT 病情 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,3)) AS C08x03C,

		CAST((SELECT 诊断 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,4)) AS VARCHAR(20)) C06x04C,
		(SELECT 编码 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,4)) AS C07x04N,
		(SELECT 病情 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,4)) AS C08x04C,

		CAST((SELECT 诊断 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,5)) AS VARCHAR(20)) C06x05C,
		(SELECT 编码 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,5)) AS C07x05N,
		(SELECT 病情 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,5)) AS C08x05C,

		CAST((SELECT 诊断 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,6)) AS VARCHAR(20)) C06x06C,
		(SELECT 编码 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,6)) AS C07x06N,
		(SELECT 病情 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,6)) AS C08x06C,

		CAST((SELECT 诊断 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,7)) AS VARCHAR(20)) C06x07C,
		(SELECT 编码 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,7)) AS C07x07N,
		(SELECT 病情 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,7)) AS C08x07C,

		CAST((SELECT 诊断 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,8)) AS VARCHAR(20)) C06x08C,
		(SELECT 编码 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,8)) AS C07x08N,
		(SELECT 病情 FROM F_Get报表病案诊断(B.病人ID,B.主页ID,8)) AS C08x08C,--此处省略到40诊断
		NULL AS C09C,
		NULL AS C10N,
		A.病理号 AS C11,
		NULL AS C12C,
		NULL AS C13N,
		CASE ISNULL(A.药物过敏,'1') WHEN '无' THEN '1' ELSE 2 END AS C24C,
		A.过敏药物 AS C25,
		ISNULL(A.科主任,'-') AS B22,
		isnull(A.主任医师,'-') as B23,
		ISNULL(A.主治医师,'-') AS B24,
		ISNULL(A.住院医师,'-') AS B25,
		ISNULL(A.责任护士,'-') AS B26,
		A.进修医师 as B27,
		A.实习医师 AS B28,
		isnull(A.编码员,'-') AS B29,
		A.病案质量编号 AS B30C,
		A.质控医师 AS B31,
		A.质控护士 as B32,
		A.质控日期 AS B33,
		A.尸检编号 AS C34C,
		A.血型编号 AS C26C,
		isNull(A.RH编号,'4')AS C27C,
		(SELECT 手术编码 FROM F_Get报表病案手术(B.病人ID,B.主页ID,1))     as C14x01C,
		(SELECT 手术名称 FROM F_Get报表病案手术(B.病人ID,B.主页ID,1))     as C15x01N,
		(SELECT 手术日期 FROM F_Get报表病案手术(B.病人ID,B.主页ID,1))     as C16x01,
		(SELECT 手术级别 FROM F_Get报表病案手术(B.病人ID,B.主页ID,1))     AS C17x01,
		(SELECT 术者 FROM F_Get报表病案手术(B.病人ID,B.主页ID,1))         AS C18x01,
		(SELECT I助 FROM F_Get报表病案手术(B.病人ID,B.主页ID,1))          AS C19x01,
		(SELECT II助 FROM F_Get报表病案手术(B.病人ID,B.主页ID,1))         AS C20x01,
		(SELECT 切开愈合等级 FROM F_Get报表病案手术(B.病人ID,B.主页ID,1)) AS C21x01C,
		(SELECT 麻醉方式 FROM F_Get报表病案手术(B.病人ID,B.主页ID,1))     AS C22x01C,
		(SELECT 麻醉医师 FROM F_Get报表病案手术(B.病人ID,B.主页ID,1))     AS C23x01,

		(SELECT 手术编码 FROM F_Get报表病案手术(B.病人ID,B.主页ID,2))     as C35x01C,
		(SELECT 手术名称 FROM F_Get报表病案手术(B.病人ID,B.主页ID,2))     as C36x01N,
		(SELECT 手术日期 FROM F_Get报表病案手术(B.病人ID,B.主页ID,2))     as C37x01,
		(SELECT 手术级别 FROM F_Get报表病案手术(B.病人ID,B.主页ID,2))     as C38x01,
		(SELECT 术者 FROM F_Get报表病案手术(B.病人ID,B.主页ID,2))         as C39x01,
		(SELECT I助 FROM F_Get报表病案手术(B.病人ID,B.主页ID,2))          as C40x01,
		(SELECT II助 FROM F_Get报表病案手术(B.病人ID,B.主页ID,2))         as C41x01,
		(SELECT 切开愈合等级 FROM F_Get报表病案手术(B.病人ID,B.主页ID,2)) as C42x01C,
		(SELECT 麻醉方式 FROM F_Get报表病案手术(B.病人ID,B.主页ID,2))     as C43x01C,
		(SELECT 麻醉医师 FROM F_Get报表病案手术(B.病人ID,B.主页ID,2))     as C44x01,

		(SELECT 手术编码 FROM F_Get报表病案手术(B.病人ID,B.主页ID,3))     as C35x02C,
		(SELECT 手术名称 FROM F_Get报表病案手术(B.病人ID,B.主页ID,3))     as C36x02N,
		(SELECT 手术日期 FROM F_Get报表病案手术(B.病人ID,B.主页ID,3))     as C37x02,
		(SELECT 手术级别 FROM F_Get报表病案手术(B.病人ID,B.主页ID,3))     as C38x02,
		(SELECT 术者 FROM F_Get报表病案手术(B.病人ID,B.主页ID,3))         as C39x02,
		(SELECT I助 FROM F_Get报表病案手术(B.病人ID,B.主页ID,3))          as C40x02,
		(SELECT II助 FROM F_Get报表病案手术(B.病人ID,B.主页ID,3))         as C41x02,
		(SELECT 切开愈合等级 FROM F_Get报表病案手术(B.病人ID,B.主页ID,3)) as C42x02C,
		(SELECT 麻醉方式 FROM F_Get报表病案手术(B.病人ID,B.主页ID,3))     as C43x02C,
		(SELECT 麻醉医师 FROM F_Get报表病案手术(B.病人ID,B.主页ID,3))     as C44x02,

		(SELECT 手术编码 FROM F_Get报表病案手术(B.病人ID,B.主页ID,4))     as C35x03C,
		(SELECT 手术名称 FROM F_Get报表病案手术(B.病人ID,B.主页ID,4))     as C36x03N,
		(SELECT 手术日期 FROM F_Get报表病案手术(B.病人ID,B.主页ID,4))     as C37x03,
		(SELECT 手术级别 FROM F_Get报表病案手术(B.病人ID,B.主页ID,4))     as C38x03,
		(SELECT 术者 FROM F_Get报表病案手术(B.病人ID,B.主页ID,4))         as C39x03,
		(SELECT I助 FROM F_Get报表病案手术(B.病人ID,B.主页ID,4))          as C40x03,
		(SELECT II助 FROM F_Get报表病案手术(B.病人ID,B.主页ID,4))         as C41x03,
		(SELECT 切开愈合等级 FROM F_Get报表病案手术(B.病人ID,B.主页ID,4)) as C42x03C,
		(SELECT 麻醉方式 FROM F_Get报表病案手术(B.病人ID,B.主页ID,4))     as C43x03C,
		(SELECT 麻醉医师 FROM F_Get报表病案手术(B.病人ID,B.主页ID,4))     as C44x03,

		(SELECT 手术编码 FROM F_Get报表病案手术(B.病人ID,B.主页ID,5))     as C35x04C,
		(SELECT 手术名称 FROM F_Get报表病案手术(B.病人ID,B.主页ID,5))     as C36x04N,
		(SELECT 手术日期 FROM F_Get报表病案手术(B.病人ID,B.主页ID,5))     as C37x04,
		(SELECT 手术级别 FROM F_Get报表病案手术(B.病人ID,B.主页ID,5))     as C38x04,
		(SELECT 术者 FROM F_Get报表病案手术(B.病人ID,B.主页ID,5))         as C39x04,
		(SELECT I助 FROM F_Get报表病案手术(B.病人ID,B.主页ID,5))          as C40x04,
		(SELECT II助 FROM F_Get报表病案手术(B.病人ID,B.主页ID,5))         as C41x04,
		(SELECT 切开愈合等级 FROM F_Get报表病案手术(B.病人ID,B.主页ID,5)) as C42x04C,
		(SELECT 麻醉方式 FROM F_Get报表病案手术(B.病人ID,B.主页ID,5))     as C43x04C,
		(SELECT 麻醉医师 FROM F_Get报表病案手术(B.病人ID,B.主页ID,5))     as C44x04,

		(SELECT 手术编码 FROM F_Get报表病案手术(B.病人ID,B.主页ID,6))     as C35x05C,
		(SELECT 手术名称 FROM F_Get报表病案手术(B.病人ID,B.主页ID,6))     as C36x05N,
		(SELECT 手术日期 FROM F_Get报表病案手术(B.病人ID,B.主页ID,6))     as C37x05,
		(SELECT 手术级别 FROM F_Get报表病案手术(B.病人ID,B.主页ID,6))     as C38x05,
		(SELECT 术者 FROM F_Get报表病案手术(B.病人ID,B.主页ID,6))         as C39x05,
		(SELECT I助 FROM F_Get报表病案手术(B.病人ID,B.主页ID,6))          as C40x05,
		(SELECT II助 FROM F_Get报表病案手术(B.病人ID,B.主页ID,6))         as C41x05,
		(SELECT 切开愈合等级 FROM F_Get报表病案手术(B.病人ID,B.主页ID,6)) as C42x05C,
		(SELECT 麻醉方式 FROM F_Get报表病案手术(B.病人ID,B.主页ID,6))     as C43x05C,
		(SELECT 麻醉医师 FROM F_Get报表病案手术(B.病人ID,B.主页ID,6))     as C44x05,--此处省略到40

		CASE WHEN DATEDIFF(DAY,A.出生日期,A.入院时间)>365
		THEN DATEDIFF(YEAR,A.出生日期,A.入院时间) 
		ELSE DATEDIFF(DAY,A.出生日期,A.入院时间) END A16,
		A.出生体重 as A18x01,
		(SELECT TOP 1 体重*1000 FROM dbo.T_ThreeSingleMeasurement WHERE A.PatientID=PatientID AND A.主页ID=主页ID AND 婴儿=2 AND 体重 IS NOT NULL) as A18x02,
		(SELECT TOP 1 体重*1000 FROM dbo.T_ThreeSingleMeasurement WHERE A.PatientID=PatientID AND A.主页ID=主页ID AND 婴儿=3 AND 体重 IS NOT NULL) as A18x03,
		(SELECT TOP 1 体重*1000 FROM dbo.T_ThreeSingleMeasurement WHERE A.PatientID=PatientID AND A.主页ID=主页ID AND 婴儿=4 AND 体重 IS NOT NULL) as A18x04,
		(SELECT TOP 1 体重*1000 FROM dbo.T_ThreeSingleMeasurement WHERE A.PatientID=PatientID AND A.主页ID=主页ID AND 婴儿=5 AND 体重 IS NOT NULL) as A18x05,
		A.入院体重 AS A17,
		0 as C28,
		0 as C29,
		0 as C30,
		0 as C31,
		0 as C32,
		0 as C33,
	    CASE WHEN A.再住院计划 IS NULL THEN 1 ELSE CASE A.再住院计划 WHEN '无' then 1 else 2 end end  AS B36C,
		A.目的 AS B37,
		SUBSTRING(A.离院方式,1,1) as B34C,
	    SUBSTRING(A.离院方式,2,LEN(A.离院方式)-1) as B35,
		ISNULL(A.总费用,0.00) AS D01,
		ISNULL(A.自付金额,0.00) AS D09,
		ISNULL(A.服务费,0.00) AS D11,
		ISNULL(A.治疗费,0.00) AS D12,
		ISNULL(A.护理费,0.00) AS D13,
		ISNULL(A.其他费用,0.00) AS D14,
		ISNULL(A.病理诊断费,0.00) AS D15,
		ISNULL(A.实验室诊断费,0.00) AS D16,
		ISNULL(A.影像诊断费,0.00) AS D17,
		ISNULL(A.临床诊断费,0.00) AS D18,
		ISNULL(A.非手术治疗费,0.00) AS D19,
		ISNULL(A.临床物理费,0.00) AS D19x01,
		ISNULL(A.手术费,0.00) + ISNULL(A.麻醉费,0.00) AS D20,
		ISNULL(A.手术费,0.00)  AS D20x01,
		ISNULL(A.麻醉费,0.00)  AS D20x02,
		ISNULL(A.康复费,0.00)  AS D21,
		ISNULL(A.中医费,0.00) AS D22,
		ISNULL(A.西药费,0.00)+ISNULL(A.抗菌药费,0.00) AS D23,
		ISNULL(A.抗菌药费,0.00) AS D23x01,
		ISNULL(A.中成药费,0.00) AS D24,
		ISNULL(A.中草药费,0.00) AS D25,
		ISNULL(A.血费,0.00) AS D26,
		ISNULL(A.白蛋白类费,0.00) AS D27,
		ISNULL(A.球蛋白类费,0.00) AS D28,
		ISNULL(A.疑血因子类费,0.00) AS D29,
		ISNULL(A.细胞因子类费,0.00) AS D30,
		ISNULL(A.检查用费,0.00) AS D31,
		ISNULL(A.治疗用费,0.00) AS D32,
		ISNULL(A.手术用费,0.00) AS D33,
		ISNULL(A.其他费,0.00) AS D34,
        A.登记时间 AS CREATE_DATE ,
        NULL AS UPDATE_DATE ,
        A.登记时间 AS UPLOAD_TIME ,
        '1' AS ESTATUS
FROM    T_病案信息 A 
        LEFT JOIN 民族 R ON A.民族=R.名称
		LEFT JOIN 病人信息 O ON A.PatientID=O.ID
		LEFT JOIN dbo.临床部门 M0 ON A.入院科室ID=M0.部门ID
		LEFT JOIN dbo.临床部门 M3 ON A.出院科室ID=M3.部门ID
		LEFT JOIN dbo.临床部门 M4 ON A.转科科室ID=M4.部门ID
		LEFT JOIN dbo.疾病编码目录 M1 ON A.疾病编码=M1.编码,
        病案主页 B
        LEFT JOIN 部门表 C ON B.出院科室ID = C.ID
        LEFT JOIN 部门表 D ON B.当前病区ID = D.ID    
        LEFT JOIN 出院诊断 X ON B.病人ID = X.PatientID
                            AND B.主页ID = X.主页ID
                            AND X.诊断类别 = '0'
                            AND X.诊断类型 = '1'
		LEFT JOIN dbo.疾病编码目录 M2 ON X.疾病编码=M2.编码
        LEFT JOIN 人员表 H ON B.住院医师 = H.姓名   
WHERE   A.PatientID = B.病人ID
        AND A.主页ID = B.主页ID
		AND EXISTS(
		SELECT * FROM dbo.病人结帐记录 A2 WHERE A.PatientID=A2.病人ID AND A.主页ID =A2.主页ID
		AND A2.收费时间 BETWEEN  @Date_from  AND @date_to	 AND A2.记录状态=1
		)
END TRY
BEGIN CATCH
INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
VALUES('住院病案首页',ERROR_MESSAGE(),GETDATE())
END CATCH
---------------------------药品类
---2.8.1.	药品出入库(DI_RSG_DRUGALTER_INFO)
BEGIN TRY
INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,DETAIL_LOCAL_ID,BUSINESS_LOCAL_ID,OPERATION_TIME,INVENTORY_TIME,OPERATOR_CODE,OPERATOR_NAME,REVIEWER_CODE,
REVIEWER_NAME,EX_WAREHOUSE_DEPARTMENT_CODE,EX_WAREHOUSE_DEPARTMENT_NAME,IN_WAREHOUSE_DEPARTMENT_CODE,IN_WAREHOUSE_DEPARTMENT_NAME,BUSINESS_ID,DRUG_PROCUREMENT_CODE,INSUR_CODE,
DRUG_NAME,DRUG_CLASS_CODE,DRUG_CLASS_NAME,DRUG_PRODUCT_AREA,PRODUCT_MANUFACTURER,DRUG_EXPIRATION_DATE,RATIFIER,MINIMUM_UNIT,CONVERSION_FACTOR,DRUG_SPECIFICATION,MSUNITNO,
PACKAGING_SYSTEM,BATCH_NUM,BATCH,CHANGE_NUM,UNIT,TRADE_PRICE,PURCHASE_PRICE,SELLING_PRICE,TOTAL_AMOUNT,WAREHOUSE_ACCESS_FLAG,WAREHOUSE_ACCESS_WAY,SUPPLIER_CODE,SUPPLIER_NAME,
PROCUREMENT_MODE,PURCHASING_DOCUMENT_NUMBER,CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS FROM DI_RSG_DRUGALTER_INFO')
SELECT  ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,
        A.ID AS DETAIL_LOCAL_ID ,
        A.NO AS BUSINESS_LOCAL_ID ,
        A.填制日期 AS OPERATION_TIME ,
        A.审核日期 AS INVENTORY_TIME ,
        B.编号 AS OPERATOR_CODE ,
        A.填制人 AS OPERATOR_NAME ,
        C.编号 AS REVIEWER_CODE ,
        C.姓名 AS REVIEWER_NAME ,
        E.编码  AS EX_WAREHOUSE_DEPARTMENT_CODE ,
        E.名称  AS EX_WAREHOUSE_DEPARTMENT_NAME ,
        D.编码  AS IN_WAREHOUSE_DEPARTMENT_CODE ,
        D.名称  AS IN_WAREHOUSE_DEPARTMENT_NAME ,
        CAST( F.编码 AS varchar(50)) AS BUSINESS_ID ,
        '' AS DRUG_PROCUREMENT_CODE ,
         isnull(G.项目编码,'-')  AS INSUR_CODE ,
        F.名称 AS DRUG_NAME ,
        J.编码 AS DRUG_CLASS_CODE ,
        J.名称 AS DRUG_CLASS_NAME ,
        CAST( A.产地 AS varchar(50)) AS DRUG_PRODUCT_AREA ,
        CAST( ISNULL(H.上次产地,ISNULL(A.产地,'-')) AS varchar(50)) AS PRODUCT_MANUFACTURER ,
        A.效期 AS DRUG_EXPIRATION_DATE ,
        CAST( ISNULL(REPLACE(A.批准文号,' ',null),'-') AS varchar(50)) AS RATIFIER ,
        CAST( F.计算单位 AS varchar(10)) AS MINIMUM_UNIT ,
        H.剂量系数 AS CONVERSION_FACTOR ,
        CAST( F.规格 AS varchar(20)) AS DRUG_SPECIFICATION ,
        CAST( H.药库单位 AS varchar(10)) AS MSUNITNO ,
        H.药库包装 AS PACKAGING_SYSTEM ,
        A.批号 AS BATCH_NUM ,
        A.批次 AS BATCH ,
        A.实际数量 AS CHANGE_NUM ,
        CAST( F.计算单位 AS varchar(10)) AS UNIT ,
        CASE WHEN A.单据 = '12'
             THEN CAST(ABS(A.零售金额) / A.实际数量 AS NUMERIC(18, 3))
             ELSE A.成本价
        END AS TRADE_PRICE ,
        CASE WHEN A.单据 = '12'
             THEN CAST(ABS(A.零售金额) / A.实际数量 AS NUMERIC(18, 3))
             ELSE A.成本价
        END AS PURCHASE_PRICE ,
        CAST( A.零售价 AS NUMERIC(18, 3)) AS SELLING_PRICE ,
        CAST(A.零售金额 AS NUMERIC(18, 3)) AS TOTAL_AMOUNT ,
        CASE WHEN A.入出系数 = -1 THEN 0
             ELSE CASE WHEN A.单据 = '1'
                            AND A.发药方式 = 1 THEN 0
                       ELSE 1
                  END
        END WAREHOUSE_ACCESS_FLAG ,
        CASE WHEN A.单据 = '1'
                  AND A.发药方式 = 0 THEN 6
             WHEN A.单据 = '1'
                  AND A.发药方式 = 1 THEN 1
             WHEN A.单据 = '6'
                  AND A.入出系数 = -1 THEN 2
             WHEN A.单据 = '6'
                  AND A.入出系数 = 1 THEN 4
             WHEN A.单据 = '7'
                  AND A.入出系数 = -1 THEN 0
             WHEN A.单据 = '8'
                  AND A.入出系数 = -1 THEN 8
             WHEN A.单据 = '8'
                  AND A.入出系数 = 1 THEN 9
             WHEN A.单据 = '9'
                  AND A.入出系数 = -1 THEN 8
             WHEN A.单据 = '9'
                  AND A.入出系数 = 1 THEN 9
             WHEN A.单据 = '11'
                  AND A.入出系数 = -1 THEN 0
             WHEN A.单据 = '11'
                  AND A.入出系数 = 1 THEN 5
             WHEN A.单据 = '12'
                  AND A.入出系数 = -1 THEN 0
             WHEN A.单据 = '12'
                  AND A.入出系数 = 1 THEN 6
             ELSE 11
        END AS WAREHOUSE_ACCESS_WAY ,
        K.编码 AS SUPPLIER_CODE ,
        K.名称 AS SUPPLIER_NAME ,
        '0' AS PROCUREMENT_MODE ,
        A.NO AS PURCHASING_DOCUMENT_NUMBER ,
        A.填制日期 AS CREATE_DATE ,
        A.填制日期 AS UPDATE_DATE ,
        GETDATE() AS UPLOAD_TIME ,
        '1' AS ESTATUS
FROM    药品收发记录 A
        LEFT JOIN 人员表 B ON ISNULL(A.填制人,A.配药人) = B.姓名 and ISNULL(b.是否停用,0)=0
        LEFT JOIN 人员表 C ON A.审核人 = C.姓名 and ISNULL(C.是否停用,0)=0
        LEFT JOIN 供应商 K ON A.供药单位ID = K.ID
        LEFT JOIN 部门表 D ON A.库房ID = D.ID 
        LEFT JOIN 部门表 E ON A.库房ID = E.ID
                          -- AND A.单据 = '1'       
        LEFT JOIN 保险支付项目 G ON A.药品ID = G.收费细目ID
                              AND G.险类 = 3 ,
        药品规格 H
        LEFT JOIN 诊疗项目目录 I ON H.药名ID = I.ID
        LEFT JOIN 诊疗分类目录 J ON I.分类ID = J.ID,
		 收费项目目录 F 
WHERE   A.药品ID = H.药品ID AND A.药品ID = F.ID  AND ISNULL(F.是否停用, 0) = 0
        AND ISNULL(H.材料, 0) = 0
        AND A.审核日期 BETWEEN @Date_from  AND @date_to		
        AND 单据 IN ( 1, 6, 7, 8, 9, 11,12 )
		AND A.实际数量<>0
END TRY
BEGIN CATCH
INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
VALUES('药品出入库',ERROR_MESSAGE(),GETDATE())
END CATCH
---2.8.3.	药品库存信息表(DRUG_INVENTORY_INFO)
BEGIN TRY
INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,INVENTORY_NO,MODIFICATION_FLAG,DRUG_CODING,DRUG_PROCUREMENT_CODE,STANDARD_CODE,SUPERVISE_CODE,CATALOGUE_CODE,
DRUG_NAME,DRUG_TYPE,BATCH_NUMBER,VALIDITY_PERIOD,INVENTORY,INVENTORY_U,INVENTORY_D,SUK,SMALLEST_UNIT,SPECIFICATION,UNIT,PACKAGE_NUMBER,MANUFACTURER_CODE,MANUFACTURER,
ESSENTIAL_DRUG_FLAG,ESSENTIAL_DRUG_LEVEL,WAREHOUSE_FLAG,WAREHOUSE_CODE,WAREHOUSE_NAME,DRUG_INVENTORY_CODE,DRUG_TYPE_NAME,DRUG_ORIGIN,RATIFY_NUMBER,INVENTORY_TIME,
PURCHASE_PRICE,RETAIL_PRICE,TRADE_PRICE,DELIVERY_COUNT,INVENTORY_QUANTITY,FLEXIBLE,UPLOAD_TIME,ESTATUS,CREATE_DATE FROM DRUG_INVENTORY_INFO')

		SELECT  ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,
        CONCAT(A.库房ID, A.药品ID, A.批次) AS INVENTORY_NO ,
        1 AS MODIFICATION_FLAG ,
         B.编码  AS DRUG_CODING ,
        '' AS DRUG_PROCUREMENT_CODE ,
        '' AS STANDARD_CODE ,
        CAST(C.项目编码  AS varchar(30)) AS SUPERVISE_CODE ,
        CAST((SELECT dbo.F_药品大类(J.名称))  AS varchar(30)) AS CATALOGUE_CODE ,
        CAST( B.名称  AS varchar(200)) AS DRUG_NAME ,
        CASE B.类别
          WHEN '5' THEN '1'
          WHEN '6' THEN '2'
          WHEN '7' THEN '3'
        END DRUG_TYPE,
		CAST(A.上次批号  AS varchar(20)) AS BATCH_NUMBER,
		A.效期 AS VALIDITY_PERIOD,
		CAST(A.实际数量 AS varchar(20)) AS INVENTORY,
		NULL AS INVENTORY_U,
		NULL AS INVENTORY_D,
		CAST(B.计算单位  AS varchar(10)) AS SUK,
		CAST(B.计算单位 AS varchar(10)) AS SMALLEST_UNIT,
		CAST( B.规格 AS varchar(30)) SPECIFICATION,
		CAST(H.药库单位  AS varchar(10)) AS UNIT,
		cast(A.实际数量/H.药库包装 AS numeric(16,4)) PACKAGE_NUMBER,
		''AS MANUFACTURER_CODE,
		CAST(A.上次产地  AS varchar(64)) AS MANUFACTURER,
		CASE H.基本药物 WHEN '国家基本药物' THEN '1' ELSE '2' END AS ESSENTIAL_DRUG_FLAG,
		CASE H.基本药物 
		WHEN '国家基本药物' THEN '01'
		WHEN '省增补基本药物' THEN '02'
		WHEN '市增补基本药物' THEN '03'
	    END AS ESSENTIAL_DRUG_LEVEL,
		'1' AS WAREHOUSE_FLAG,
			K.编码 AS  WAREHOUSE_CODE,
	    CAST(K.名称  AS varchar(30))AS  WAREHOUSE_NAME,
		'' AS DRUG_INVENTORY_CODE,
		 CASE B.类别
          WHEN '5' THEN '西药'
          WHEN '6' THEN '中成药'
          WHEN '7' THEN '中草药' END AS DRUG_TYPE_NAME,
		CAST(A.上次产地  AS varchar(50)) AS DRUG_ORIGIN,
		CAST(A.批准文号  AS varchar(30)) AS RATIFY_NUMBER,
		L.审核日期 AS INVENTORY_TIME,
		CAST(A.上次采购价  AS numeric(16,4)) AS PURCHASE_PRICE,
		CAST(A.零售价  AS numeric(16,4)) AS RETAIL_PRICE,
		CAST(A.零售价  AS numeric(16,4)) AS TRADE_PRICE,
		NULL AS DELIVERY_COUNT,
		NULL AS INVENTORY_QUANTITY,
		GETDATE() AS FLEXIBLE,
		GETDATE() UPLOAD_TIME,
		'1' AS ESTATUS,getdate() CREATE_DATE
FROM    药品库存 A
        LEFT JOIN 收费项目目录 B ON A.药品ID = B.ID
        LEFT JOIN 保险支付项目 C ON A.药品ID = C.收费细目ID
                              AND C.险类 = 3
	    LEFT JOIN dbo.部门表 K ON A.库房ID=K.ID
		LEFT JOIN dbo.药品收发记录 L ON A.库房ID=L.库房ID AND A.药品ID=L.药品ID
		AND A.批次=L.批次 AND L.单据='1',
        药品规格 H
        LEFT JOIN 诊疗项目目录 I ON H.药名ID = I.ID
        LEFT JOIN 诊疗分类目录 J ON I.分类ID = J.ID
WHERE   A.药品ID = H.药品ID and  isNULL(B.是否停用,0)=0
        AND ISNULL(H.材料, 0) = 0
END TRY
BEGIN CATCH
INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
VALUES('药品库存信息表',ERROR_MESSAGE(),GETDATE())
END CATCH	
---2.8.5    药品调价历史（DRUG_ADJ_HIS）1级
BEGIN TRY
INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,DETAIL_LOCAL_ID,DRUG_CODE,DRUG_PROCUREMENT_CODE,
OWN_STANDARD_CODE,SUPERVISION_CODE,INSUR_CODE,SELF_SYS_DRUG_CATALOGUE_CODD,DRUG_NAME,DRUG_COMMODITY_NAME,
BATCH_NUMBER,BATCH,TERM_OF_VALIDITY,PRICE_ADJUSTMENT_TIME,OPERATOR_NUMBER,OPERATOR_NAME,
PRICE_ADJUSTMENT_DOCUMENT_NO,INVENTORY,SUK,ORIGINAL_WHOLESALE_PRICE,ORIGINAL_PRICE,ORIGINAL_RETAIL_PRICE,
WHOLESALE_PRICE_NOW,PRICE_NOW,RETAIL_PRICE_NOW,WHOLESALE_PRICE_ADJUST_PROFIT,RETAIL_PRICE_ADJUST_PROFIT,
CONVERSION_FACTOR,PRICE_ADJUSTMENT_CATEGORY,PRICE_ADJUSTMENT_METHOD,ADJUST_PRICE_REASON,ESSENTIAL_DRUG_FLAG,
ESSENTIAL_DRUG_LEVEL,CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS FROM DRUG_ADJ_HIS')
SELECT  ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME,
		A.ID AS DETAIL_LOCAL_ID,
		B.编码 AS DRUG_CODE,
		'' AS DRUG_PROCUREMENT_CODE,
		NULL AS OWN_STANDARD_CODE,
		NULL AS SUPERVISION_CODE,
		C.项目编码 AS INSUR_CODE,
		F.编码 AS SELF_SYS_DRUG_CATALOGUE_CODD,
		B.名称 AS DRUG_NAME,
		ISNULL(B2.名称,B.名称) AS DRUG_COMMODITY_NAME,
		A2.批号 AS BATCH_NUMBER,
		A2.批次 AS BATCH,
		A2.效期 AS TERM_OF_VALIDITY,
		A2.审核日期 AS PRICE_ADJUSTMENT_TIME,		
		C2.GH AS OPERATOR_NUMBER,
		A.调价人 AS OPERATOR_NAME,
		A.NO AS PRICE_ADJUSTMENT_DOCUMENT_NO,
		A2.付数*A2.实际数量 AS INVENTORY,
		B.计算单位 AS SUK,
		CAST(A2.成本价 AS NUMERIC(12,2)) ORIGINAL_WHOLESALE_PRICE,
		CAST(A2.成本价 AS NUMERIC(12,2)) AS ORIGINAL_PRICE,
		CAST(A2.成本价 AS NUMERIC(12,2)) AS ORIGINAL_RETAIL_PRICE,
		CAST(A2.零售价 AS NUMERIC(12,2)) AS WHOLESALE_PRICE_NOW,
		0.00 AS PRICE_NOW,
		CAST(A2.零售价 AS NUMERIC(12,2)) AS RETAIL_PRICE_NOW,
		A2.差价 AS WHOLESALE_PRICE_ADJUST_PROFIT,
		A2.差价 AS RETAIL_PRICE_ADJUST_PROFIT,
		D.剂量系数 AS CONVERSION_FACTOR,
		null AS PRICE_ADJUSTMENT_CATEGORY,
		0 AS PRICE_ADJUSTMENT_METHOD,
		A.调价说明 AS ADJUST_PRICE_REASON,
		CASE ISNULL(D.基本药物,'2') 
		WHEN '国家基本药物' THEN '1' 
		WHEN '省增补基本药物' THEN '1'
		WHEN '市增补基本药物' THEN '1'
		ELSE '2' END AS ESSENTIAL_DRUG_FLAG,
		CASE ISNULL(D.基本药物,'') WHEN '国家基本药物' THEN '01' 
		WHEN '省增补基本药物' THEN '02'
		WHEN '市增补基本药物' THEN '03'
		ELSE '' END AS ESSENTIAL_DRUG_LEVEL,
		A2.审核日期 AS CREATE_DATE,
		GETDATE() AS UPDATE_DATE,
		GETDATE() AS UPLOAD_TIME,
		1 AS ESTATUS
FROM    dbo.收费价目 A ( NOLOCK )
	    LEFT JOIN dbo.保险支付项目 C ON A.收费细目ID=C.收费细目ID AND C.险类='3' 
		LEFT JOIN dbo.T_UserDB C2 ON A.调价人=C2.XM, 
		dbo.收费项目目录 B 	
		LEFT JOIN dbo.收费项目别名 B2 ON B.ID=B2.收费细目ID AND B2.性质=3 AND B2.码类=1,
	    药品规格 D 
		LEFT JOIN dbo.诊疗项目目录 E ON D.药名ID=E.ID
		LEFT JOIN dbo.诊疗分类目录 F ON E.分类ID=F.ID,
		dbo.药品收发记录 A2 
WHERE   A.收费细目ID=B.ID AND B.类别 IN('5','6','7') 
        AND A.收费细目ID=A2.药品ID
		AND A2.审核日期 BETWEEN @Date_from  AND @date_to	 
		AND A2.单据='13' AND A2.入出类别ID=4
		AND A.ID=ISNULL(A2.价格ID,'-1')
        AND B.ID=D.药品ID AND ISNULL(D.材料,0)=0
        AND (A.终止日期 IS NULL
        OR A.终止日期  >= GETDATE());  
END TRY
BEGIN CATCH
INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
VALUES('药品调价历史',ERROR_MESSAGE(),GETDATE())
END CATCH
---2.4.1.	检查记录(INSPECTION_RECORD)（优先级1）
BEGIN TRY
INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,CLINIC_DEPT_CODE,CLINIC_DEPT_NAME,PATIENT_LOCAL_ID,BUSINESS_LOCAL_ID,
ORDER_LID,ORDER_DETAIL_ID,PRESCRIBE_NO,PRESCRIBE_DETAIL_NO,ELECTRONIC_APP_NO,REG_SERIAL_NO,MEDICAL_RECORD_NO,DATA_ORIGIN,OUTPATIENT_NO,
INPATIENT_NO,VISIT_COUNT,CLINIC_TYPE_CODE,CLINIC_TYPE_NAME,WARD_NAME,WARD_NUM,BED_NUM,EXAM_RT_NO,EXAM_RT_NAME,EXAM_APPLY_ORGAN_ID,
EXAM_APPLY_ORGAN,EXAM_APPLY_ROOM,EXAM_APPLY_TIME,APPLY_PEOPLE_NO,APPLY_PEOPLE_NAME,CHIEF_COMPLAINT,START_SYMPTOMS_DATE,STOP_SYMPTOMS_DATE,
SYMPTOM_DESC,SPECIAL_EXAM_FLAG,REQUEST_REASON,REQUEST_DETAILS,HISTORY_SUMMARY,INSPECTION_PURPOSE,OPERATION_NO,OPERATION_NAME,
OPERATION_POSITION_CODE,OPERATION_POSITION_NAME,INSERTION_NAME,OPERATION_DESC,OPERATION_TIMES,OPERATION_DATE,ANESTHESIA_METHOD_CODE,
ANESTHESIA_METHOD_NAME,ANESTHESIA_OBSERVATION_RESULT,ANESTHESIA_DOCTOR_FLAG_CODE,ANESTHESIA_DOCTOR_FLAG,ANESTHESIA_DOCTOR_SIGNATURE,
TREATMENT_PROCESS_DESC,SAMPLE_TYPE,EXAM_INSPECTION_NO,SPECIMEN_FIXATIVE_NAME,SPECIMEN_SAMPLE_DATE,RECEIVE_SPECIMEN_DATE,EXAM_FLAG,
EXAM_FLAG_NAME,CHECK_TYP_CODE,EXAM_TYPE,EXAM_METHOD_NAME,EXAM_ITEM_CODE,EXAM_HOSP_ITEM_CODE,EXAM_ITEM_NAME,EXAM_HOSP_ITEM_NAME,EXAM_RESULT_CODE,
EXAM_RESULT,EXAM_RESULT_IF_POSITIVE,EXAM_RESULT_IF_ABNORMAL,EXAM_QUANTIFY_RESULT,EXAM_QUANTIFY_UNIT,EXAM_SUMMER,TECHNICIAN_SIG,EXAM_DOCTOR,
CHECK_DEPT_CODE,EXAM_DATE,EXAM_REPORT_ORGAN_ID,EXAM_REPORT_ORGAN,EXAM_REPORT_ROOM,OBJECTIVE_EXAM_RESULT,SUBJECTIVE_EXAM_RESULT,
EXAM_RT_REMARKS,EXAM_RT_DATE,REPORT_DOCTOR,REPORTAUDIT,AUDIT_DATE,OUTPATIENT_CHARGE_NO,INPATIENT_CHARGE_NO,CREATE_DATE,UPDATE_DATE,
UPLOAD_TIME,ESTATUS FROM INSPECTION_RECORD')
SELECT DISTINCT ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,
		C.编码 AS CLINIC_DEPT_CODE,
		C.名称 AS CLINIC_DEPT_NAME,
		 CONCAT(( SELECT ZZJGDM
                 FROM   dbo.T_JGGL
               ), A.病人ID)AS PATIENT_LOCAL_ID,
		A.序号 AS BUSINESS_LOCAL_ID,
		A.ID AS ORDER_LID,
		A.ID AS ORDER_DETAIL_ID,
		NULL AS PRESCRIBE_NO,
		NULL AS PRESCRIBE_DETAIL_NO,
		B.NO AS ELECTRONIC_APP_NO,
		A.ID AS REG_SERIAL_NO,
		NULL AS MEDICAL_RECORD_NO,
		1 AS DATA_ORIGIN,
		D.门诊号 AS OUTPATIENT_NO,
		NULL AS INPATIENT_NO,
		 (SELECT dbo.F_就诊次数(A.病人ID)) AS VISIT_COUNT,
		CASE D.急诊 WHEN '0' THEN '1' ELSE '2' END AS CLINIC_TYPE_CODE,--1,2,3,9 门诊、急诊、住院、其他
		CASE D.急诊 WHEN '0' THEN '门诊' ELSE '急诊' END AS CLINIC_TYPE_NAME,
		NULL AS WARD_NAME,
		NULL AS WARD_NUM,
		NULL AS BED_NUM ,
		F3.检查号 AS EXAM_RT_NO,--检查报告单编号
		 CASE B.收据费目 WHEN '心电图' THEN '心电图'
		 WHEN 'B超' THEN '彩超'
		  ELSE '其他检查' END AS EXAM_RT_NAME ,--检查报告单名称
		( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS EXAM_APPLY_ORGAN_ID,--检查申请机构代码
		( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS EXAM_APPLY_ORGAN,--检查申请机构名称
		C2.名称 AS EXAM_APPLY_ROOM,
		F.发送时间 AS EXAM_APPLY_TIME,
		F2.GH AS APPLY_PEOPLE_NO,
		F2.XM AS APPLY_PEOPLE_NAME,
		DBO.SubStr(SUBSTRING(A.超量说明,0,CHARINDEX('|',A.超量说明)),CHARINDEX('@@',A.超量说明)+2)
		AS CHIEF_COMPLAINT,
		NULL AS START_SYMPTOMS_DATE,
		NULL AS STOP_SYMPTOMS_DATE,
		( SELECT    data = STUFF(( SELECT   '#' + [T].[诊断ID]
                                   FROM     病人诊断记录 T
                                   WHERE    病人ID = D.病人ID
                                            AND 主页ID = D.ID
                                 FOR
                                   XML PATH('')
                                 ), 1, 1, '')) AS SYMPTOM_DESC,
		 1 AS SPECIAL_EXAM_FLAG,--特殊检查标志
		 NULL AS REQUEST_REASON,
		 A.医嘱内容 AS REQUEST_DETAILS,
		 NULL AS HISTORY_SUMMARY,
		 NULL AS INSPECTION_PURPOSE,--检查目的
		 '00.0900' AS OPERATION_NO,--操作编码(手术操作分类代码国家临床版2.0)
		 NULL AS OPERATION_NAME,--按照手术操作分类代码国家临床版2.0
		 NULL AS OPERATION_POSITION_CODE,--操作部位代码
		 NULL AS OPERATION_POSITION_NAME,--操作部位名称
		 NULL AS INSERTION_NAME,--介入物名称
		 NULL AS OPERATION_DESC,--操作方法描述
		 NULL AS OPERATION_TIMES,--操作次数
		 NULL AS OPERATION_DATE,--操作日期时间
		 NULL AS ANESTHESIA_METHOD_CODE,--麻醉方法代码
		 NULL AS ANESTHESIA_METHOD_NAME,--麻醉方法名称
		 NULL AS ANESTHESIA_OBSERVATION_RESULT,--麻醉观察结果
		 NULL AS ANESTHESIA_DOCTOR_FLAG_CODE,--麻醉中西医标识代码
		 NULL AS ANESTHESIA_DOCTOR_FLAG,--麻醉中西医标识
		 NULL AS ANESTHESIA_DOCTOR_SIGNATURE,--麻醉医师签名
		 NULL AS TREATMENT_PROCESS_DESC,
		 NULL AS SAMPLE_TYPE,
		 NULL AS EXAM_INSPECTION_NO,
		 NULL AS SPECIMEN_FIXATIVE_NAME,
		 NULL AS SPECIMEN_SAMPLE_DATE,
		 NULL AS RECEIVE_SPECIMEN_DATE,
		 CASE B.收据费目 WHEN '心电图' THEN '5'
		 WHEN 'B超' THEN '2'
		  ELSE '6' END AS EXAM_FLAG,--FD06.00.005.00 1病理，2超声，3放射，4内镜，5心电，6其他
		 CASE B.收据费目 WHEN '心电图' THEN '心电'
		 WHEN 'B超' THEN '超声'
		  ELSE '6' END  AS EXAM_FLAG_NAME,--检查标识名称
		 CASE B.收据费目 WHEN '心电图' THEN '401'
		 WHEN 'B超' THEN '206'
		  ELSE '299' END AS CHECK_TYP_CODE,--检查-类别代码
		 CASE B.收据费目 WHEN '心电图' THEN '心电'
		 WHEN 'B超' THEN '超声检查'
		  ELSE '其他检查项目' END AS EXAM_TYPE,--检查类别
		 '-' AS EXAM_METHOD_NAME,--检查方法名称
		 CASE B.收据费目 WHEN '心电图' THEN '11'
		 WHEN 'B超' THEN '7'
		  ELSE '11' END  AS EXAM_ITEM_CODE,--检查项目代码
		 M1.编码 AS EXAM_HOSP_ITEM_CODE,--院内检查项目代码
		 M1.名称 AS EXAM_ITEM_NAME,
		 M1.名称 AS EXAM_HOSP_ITEM_NAME,--院内检查项目名称
		 CASE F3.报告结果 WHEN '阴性' THEN '1'
		 WHEN '阳性' THEN '2' ELSE '23' END AS EXAM_RESULT_CODE,--检查结果代码
		 F3.报告结果 AS EXAM_RESULT,--检查结果
		 CASE F3.报告结果 WHEN '阴性' THEN '2'
		 WHEN '阳性' THEN '1' ELSE '2' END AS EXAM_RESULT_IF_POSITIVE,--检查结果是否阳性
		 CASE F3.报告结果 WHEN '阴性' THEN '1'
		 WHEN '阳性' THEN '2' ELSE '23' END AS EXAM_RESULT_IF_ABNORMAL,--检查结果异常标识
		 NULL AS EXAM_QUANTIFY_RESULT,--检查定量结果
		 NULL AS EXAM_QUANTIFY_UNIT,--检查定量结果计量单位
		 F3.影像诊断 AS EXAM_SUMMER,--检查结论
		 F3.检查医生 AS TECHNICIAN_SIG,
		 F3.检查医生 AS EXAM_DOCTOR,
		 C2.编码 AS CHECK_DEPT_CODE,
		 F3.检查日期 AS EXAM_DATE,
		 ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL)  AS EXAM_REPORT_ORGAN_ID,
		 ( SELECT    JGMC
          FROM      dbo.T_JGGL) AS EXAM_REPORT_ORGAN,
		 C2.名称 AS EXAM_REPORT_ROOM,
		 F3.影像描述 AS OBJECTIVE_EXAM_RESULT,
		 F3.影像诊断 AS SUBJECTIVE_EXAM_RESULT,
		 NULL AS EXAM_RT_REMARKS,
		 F3.报告日期 AS EXAM_RT_DATE,
		 F3.报告医生 AS REPORT_DOCTOR,
		 F3.报告医生 AS REPORTAUDIT,
		 F3.报告日期 AS AUDIT_DATE,
		 B.结帐ID AS OUTPATIENT_CHARGE_NO,
		 NULL AS INPATIENT_CHARGE_NO,
		 F3.报告日期 AS CREATE_DATE,
		 NULL AS UPDATE_DATE,
		 GETDATE() AS UPLOAD_TIME,
		 1 AS ESTATUS
FROM    dbo.病人医嘱记录 A (NOLOCK)INNER JOIN 
        dbo.门诊费用记录 B (NOLOCK)ON A.ID=B.医嘱序号 AND B.记录状态=1
		LEFT JOIN dbo.部门表 C ON A.病人科室ID=C.ID
		LEFT JOIN dbo.部门表 C2 ON A.执行科室ID=C2.ID
		LEFT JOIN dbo.病人挂号记录 D (NOLOCK)ON A.挂号单=D.NO
		LEFT JOIN 病人信息 E ON A.病人ID=E.ID
		LEFT JOIN dbo.T_UserDB F2 ON A.开嘱医生=F2.XM
		LEFT JOIN dbo.收费项目目录 M1(NOLOCK) ON A.诊疗项目ID=M1.ID AND M1.诊疗项目=1,
		dbo.PACS报告 F3(NOLOCK) ,
		dbo.病人医嘱发送 F (NOLOCK)		
WHERE   A.ID=F.医嘱ID 
        AND A.ID=F3.医嘱ID 
		AND A.诊疗类别 = 'D'
        AND F3.报告日期 BETWEEN @Date_from  AND @date_to	
		AND A.执行科室ID IN(66)
UNION 
--住院
SELECT DISTINCT ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,
		C.编码 AS CLINIC_DEPT_CODE,
		C.名称 AS CLINIC_DEPT_NAME,
		 CONCAT(( SELECT ZZJGDM
                 FROM   dbo.T_JGGL
               ), A.病人ID) AS PATIENT_LOCAL_ID,
		A.序号 AS BUSINESS_LOCAL_ID,
		A.ID AS ORDER_LID,
		A.ID AS ORDER_DETAIL_ID,
		NULL AS PRESCRIBE_NO,
		NULL AS PRESCRIBE_DETAIL_NO,
		B.NO AS ELECTRONIC_APP_NO,
     	'-' AS REG_SERIAL_NO,
		M2.住院号 AS MEDICAL_RECORD_NO,
		2 AS DATA_ORIGIN,
		NULL AS OUTPATIENT_NO,
		M2.住院号 AS INPATIENT_NO,
		 A.主页ID AS VISIT_COUNT,
		 '3'  AS CLINIC_TYPE_CODE,--1,2,3,9 门诊、急诊、住院、其他
		'住院'  AS CLINIC_TYPE_NAME,
		M4.名称 AS WARD_NAME,
		M3.房间号 AS WARD_NUM,
		M2.出院病床 AS BED_NUM ,
		F3.检查号 AS EXAM_RT_NO,--检查报告单编号
		CASE B.收据费目 WHEN '心电图' THEN '心电图'
		 WHEN 'B超' THEN '彩超'
		  ELSE '其他检查' END  AS EXAM_RT_NAME ,--检查报告单名称
		( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS EXAM_APPLY_ORGAN_ID,--检查申请机构代码
		( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS EXAM_APPLY_ORGAN,--检查申请机构名称
		C2.名称 AS EXAM_APPLY_ROOM,
		F.发送时间 AS EXAM_APPLY_TIME,
		F2.GH AS APPLY_PEOPLE_NO,
		F2.XM AS APPLY_PEOPLE_NAME,
		DBO.SubStr(SUBSTRING(A.超量说明,0,CHARINDEX('|',A.超量说明)),CHARINDEX('@@',A.超量说明)+2)
		AS CHIEF_COMPLAINT,
		NULL AS START_SYMPTOMS_DATE,
		NULL AS STOP_SYMPTOMS_DATE,
		( SELECT    data = STUFF(( SELECT   '#' + [T].[诊断ID]
                                   FROM     病人诊断记录 T
                                   WHERE    病人ID = D.病人ID
                                            AND 主页ID = D.ID
                                 FOR
                                   XML PATH('')
                                 ), 1, 1, '')) AS SYMPTOM_DESC,
		 1 AS SPECIAL_EXAM_FLAG,--特殊检查标志
		 NULL AS REQUEST_REASON,
		 A.医嘱内容 AS REQUEST_DETAILS,
		 NULL AS HISTORY_SUMMARY,
		 NULL AS INSPECTION_PURPOSE,--检查目的
		 '00.0900' AS OPERATION_NO,--操作编码(手术操作分类代码国家临床版2.0)
		 NULL AS OPERATION_NAME,--按照手术操作分类代码国家临床版2.0
		 NULL AS OPERATION_POSITION_CODE,--操作部位代码
		 NULL AS OPERATION_POSITION_NAME,--操作部位名称
		 NULL AS INSERTION_NAME,--介入物名称
		 NULL AS OPERATION_DESC,--操作方法描述
		 NULL AS OPERATION_TIMES,--操作次数
		 NULL AS OPERATION_DATE,--操作日期时间
		 NULL AS ANESTHESIA_METHOD_CODE,--麻醉方法代码
		 NULL AS ANESTHESIA_METHOD_NAME,--麻醉方法名称
		 NULL AS ANESTHESIA_OBSERVATION_RESULT,--麻醉观察结果
		 NULL AS ANESTHESIA_DOCTOR_FLAG_CODE,--麻醉中西医标识代码
		 NULL AS ANESTHESIA_DOCTOR_FLAG,--麻醉中西医标识
		 NULL AS ANESTHESIA_DOCTOR_SIGNATURE,--麻醉医师签名
		 NULL AS TREATMENT_PROCESS_DESC,
		 NULL AS SAMPLE_TYPE,
		 NULL AS EXAM_INSPECTION_NO,
		 NULL AS SPECIMEN_FIXATIVE_NAME,
		 NULL AS SPECIMEN_SAMPLE_DATE,
		 NULL AS RECEIVE_SPECIMEN_DATE,
		 CASE B.收据费目 WHEN '心电图' THEN '5'
		 WHEN 'B超' THEN '2'
		  ELSE '6' END AS EXAM_FLAG,--FD06.00.005.00 1病理，2超声，3放射，4内镜，5心电，6其他
		 CASE B.收据费目 WHEN '心电图' THEN '心电'
		 WHEN 'B超' THEN '超声'
		  ELSE '6' END  AS EXAM_FLAG_NAME,--检查标识名称
		 CASE B.收据费目 WHEN '心电图' THEN '401'
		 WHEN 'B超' THEN '206'
		  ELSE '299' END AS CHECK_TYP_CODE,--检查-类别代码
		 CASE B.收据费目 WHEN '心电图' THEN '心电'
		 WHEN 'B超' THEN '超声检查'
		  ELSE '其他检查项目' END AS EXAM_TYPE,--检查类别
		 '-' AS EXAM_METHOD_NAME,--检查方法名称
		 CASE B.收据费目 WHEN '心电图' THEN '11'
		 WHEN 'B超' THEN '7'
		  ELSE '11' END  AS EXAM_ITEM_CODE,--检查项目代码
		 M1.编码 AS EXAM_HOSP_ITEM_CODE,--院内检查项目代码
		 M1.名称 AS EXAM_ITEM_NAME,
		 M1.名称 AS EXAM_HOSP_ITEM_NAME,--院内检查项目名称
		 CASE F3.报告结果 WHEN '阴性' THEN '1'
		 WHEN '阳性' THEN '2' ELSE '23' END AS EXAM_RESULT_CODE,--检查结果代码
		 F3.报告结果 AS EXAM_RESULT,--检查结果
		 CASE F3.报告结果 WHEN '阴性' THEN '2'
		 WHEN '阳性' THEN '1' ELSE '2' END AS EXAM_RESULT_IF_POSITIVE,--检查结果是否阳性
		 CASE F3.报告结果 WHEN '阴性' THEN '1'
		 WHEN '阳性' THEN '2' ELSE '23' END AS EXAM_RESULT_IF_ABNORMAL,--检查结果异常标识
		 NULL AS EXAM_QUANTIFY_RESULT,--检查定量结果
		 NULL AS EXAM_QUANTIFY_UNIT,--检查定量结果计量单位
		 F3.影像诊断 AS EXAM_SUMMER,--检查结论
		 F3.检查医生 AS TECHNICIAN_SIG,
		 F3.检查医生 AS EXAM_DOCTOR,
		 C2.编码 AS CHECK_DEPT_CODE,
		 F3.检查日期 AS EXAM_DATE,
		 ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL)  AS EXAM_REPORT_ORGAN_ID,
		 ( SELECT    JGMC
          FROM      dbo.T_JGGL) AS EXAM_REPORT_ORGAN,
		 C2.名称 AS EXAM_REPORT_ROOM,
		 F3.影像描述 AS OBJECTIVE_EXAM_RESULT,
		 F3.影像诊断 AS SUBJECTIVE_EXAM_RESULT,
		 NULL AS EXAM_RT_REMARKS,
		 F3.报告日期 AS EXAM_RT_DATE,
		 F3.报告医生 AS REPORT_DOCTOR,
		 F3.报告医生 AS REPORTAUDIT,
		 F3.报告日期 AS AUDIT_DATE,
		 NULL AS OUTPATIENT_CHARGE_NO,
		 B.结帐ID AS INPATIENT_CHARGE_NO,
		 F3.报告日期 AS CREATE_DATE,
		 NULL AS UPDATE_DATE,
		 GETDATE() AS UPLOAD_TIME,
		 1 AS ESTATUS
FROM    dbo.病人医嘱记录 A(NOLOCK) INNER JOIN 
        dbo.住院费用记录 B(NOLOCK) ON A.ID=B.医嘱序号 AND B.记录状态=1
		LEFT JOIN dbo.部门表 C ON A.病人科室ID=C.ID
		LEFT JOIN dbo.部门表 C2 ON A.执行科室ID=C2.ID
		LEFT JOIN dbo.病人挂号记录 D(NOLOCK) ON A.挂号单=D.NO
		LEFT JOIN 病人信息 E(NOLOCK) ON A.病人ID=E.ID
		LEFT JOIN dbo.T_UserDB F2 ON A.开嘱医生=F2.XM
		LEFT JOIN dbo.收费项目目录 M1 (NOLOCK)ON A.诊疗项目ID=M1.ID AND M1.诊疗项目=1
		LEFT JOIN dbo.病案主页 M2 (NOLOCK)ON A.病人ID=M2.病人ID AND M2.主页ID=A.主页ID
		LEFT JOIN dbo.床位状况记录 M3(NOLOCK) ON M2.出院病床=M3.床号 AND M3.科室ID=M2.出院科室ID
		LEFT JOIN dbo.部门表 M4 ON M2.当前病区ID=M4.ID,
		dbo.PACS报告 F3 ,
		dbo.病人医嘱发送 F (NOLOCK)		
WHERE   A.ID=F.医嘱ID 
        AND A.ID=F3.医嘱ID 
		AND A.诊疗类别 = 'D'
        AND F3.报告日期 BETWEEN @Date_from  AND @date_to	
		AND A.执行科室ID IN(66)
END TRY
BEGIN CATCH
INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
VALUES('检查记录',ERROR_MESSAGE(),GETDATE())
END CATCH
---2.6.1    入院记录（ADMISSION_RECORD）
BEGIN TRY
INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,PATIENT_LOCAL_ID,VISIT_COUNT,BUSINESS_LOCAL_ID,INPATIENT_NO,
WARD_NAME,CLINIC_DEPT_CODE,DEPT_NAME,WARD_NUM,BED_NUM,NAME,GENDER,GENDER_NAME,AGE_YEAR,AGE_MONTH,NATION,
NATION_NAME,MARRIAGE_CODE,MARRIAGE_NAME,PROVINCE,CITY,COUNTY,TOWN_SHIP,RELATION_STREET,HOUSE_NUMBER,DETAIL,
OCCUPATION_CODE,OCCUPATION_NAME,INHOS_DATE,HISTORY_PRESENTER_NAME,PRESENTER_PATIENT_RELAT_CODE,PRESENTER_PATIENT_RELAT,
STATEMENTS_RELIABLE_MARKE,CHIEF_COMPLAINT,PRESENT_HISTORY,GENERAL_HEALTH_FLAG,MEDICAL_HISTORY,INFECTIOUS_FLAG,INFECTIOUS_HISTORY,
VACCINATION_HISTORY,OPERATION_HISTORY,BLOOD_HISTORY,ALLERGY_HISTORY,PERSONAL_HISTORY,OBSTETRICAL_HISTORY,MENSTRUAL_HISTORY,
FAMILY_HISTORY,TEMPERATURE,PULSE_RATE,RESPIRATORY_RATE,SBP,DBP,HEIGHT,WEIGHT,GENERAL_STATUS_RESULTS,SKIN_CHECK_RESULT,
LYMPH_NODE_CHECK_RESULT,HEADITS_ORGAN_EXAM_RESULT,NECK_CHECK_RESULT,CHEST_CHECK_RESULT,ABDOMINAL_CHECK_RESULT,DRE_CHECK_RESULT,
EXT_GENITAL_CHECK_ANOMALY,SPINE_CHECK_RESULT,LIMBS_CHECK_RESULT,NERVOUS_CHECK_RESULT,SPECIALIST_STATUS,AE_RESULT,CHINA_FOUR_DIAG_OBSER,
THERAPEUTIC_THERAPY,THERAPEUTIC_THERAPY_NAME,RECEPTION_DOCTOR_SIG,ADMISSION_DOCTOR_SIG,ATTENDING_DOCTOR_SIG,DIRECTOR_DOCTOR_SIGNATURE,
MEDICAL_RECORD_NO,HISTORY_STATEMENT_PHONE,HISTORY_STATEMENT_ADDRESS,INHOS_METHOD_CODE,INHOS_METHOD_NAME,HOS_SYMPTOMS_CODE,HOS_SYMPTOMS,
ATTACK,START_SYMPTOMS_DATE,STOP_SYMPTOMS_DATE,MEDICAL_PAY_WAY_CODE,PAY_WAY,HOS_DISEASE_STATUS_CODE,HOS_DISEASE_STATUS,TREATMENT_OUTCOME_CODE,
TREATMENT_OUTCOME,STRUCT_FLAG,TEXT_CONTENT,CONTENT_TYPE,CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS FROM ADMISSION_RECORD')
SELECT  ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,
		 CONCAT(( SELECT ZZJGDM
                 FROM   dbo.T_JGGL
               ), A.病人ID) AS PATIENT_LOCAL_ID ,
	    A.主页ID AS VISIT_COUNT,
		CONCAT(A.病人ID,A.主页ID) AS BUSINESS_LOCAL_ID,
		A.住院号 AS INPATIENT_NO,
		C.名称 AS WARD_NAME,
		C2.编码 AS CLINIC_DEPT_CODE,
		C2.名称 AS DEPT_NAME,
		C3.房间号 AS WARD_NUM,
		A.出院病床 AS BED_NUM,
		B.姓名 AS NAME,
		CASE B.性别
          WHEN '男' THEN '1'
          WHEN '女' THEN '2'
          WHEN '未知' THEN '0'
          ELSE '9'
        END AS GENDER ,
		B.性别 AS GENDER_NAME,
        CASE WHEN CHARINDEX('岁',A.年龄)<>0 THEN 
		SUBSTRING(A.年龄,0,CHARINDEX('岁',A.年龄)) ELSE 
		'0' END   AS AGE_YEAR,
		CASE WHEN CHARINDEX('月',A.年龄)<>0  AND CHARINDEX('岁',A.年龄)=0 THEN 
		SUBSTRING(A.年龄,0,CHARINDEX('月',A.年龄))
		WHEN CHARINDEX('月',A.年龄)<>0 AND CHARINDEX('岁',A.年龄)<>0 THEN 
		dbo.SubStr(SUBSTRING(A.年龄,0, CHARINDEX('月',A.年龄)),CHARINDEX('岁',A.年龄)+1) ELSE 
		'0' END  AS AGE_MONTH,
		C4.编码 AS NATION,
		C4.名称 AS NATION_NAME,
		C5.编码 AS MARRIAGE_CODE,
		C5.名称 AS MARRIAGE_NAME,
		B.家庭地址 AS PROVINCE,
		'' AS CITY,
		'' AS COUNTY,
		'' AS TOWN_SHIP,
		'' AS RELATION_STREET,
		'' AS HOUSE_NUMBER,
		B.现住址 AS DETAIL,
		CASE ISNULL(C6.编码 ,'90') WHEN '91' THEN '90' ELSE ISNULL(C6.编码 ,'90') END AS OCCUPATION_CODE,
		ISNULL(C6.名称,'其他')  AS OCCUPATION_NAME,
		A.入院日期 AS INHOS_DATE,
		B.陈述人 AS HISTORY_PRESENTER_NAME,
		ISNULL(H.编码,'9') AS PRESENTER_PATIENT_RELAT_CODE,
		H.名称 AS PRESENTER_PATIENT_RELAT,
		'1'AS STATEMENTS_RELIABLE_MARKE,
		ISNULL((SELECT CAST(value AS VARCHAR(100)) FROM dbo.Fn_InHospitalEelement(A.病人ID,A.主页ID) WHERE Name='主诉'),'-') AS CHIEF_COMPLAINT,--主诉
		ISNULL((SELECT CAST(value AS TEXT) FROM dbo.Fn_InHospitalEelement(A.病人ID,A.主页ID) WHERE Name='现病史'),'-') AS PRESENT_HISTORY, --现病史
		'1' AS GENERAL_HEALTH_FLAG,
	    ISNULL((SELECT CAST(value AS TEXT) FROM dbo.Fn_InHospitalEelement(A.病人ID,A.主页ID) WHERE Name='疾病史'),'-') AS MEDICAL_HISTORY,
		'2' AS INFECTIOUS_FLAG,--患者传染性标志
		'' AS INFECTIOUS_HISTORY,--传染病史
		'' AS VACCINATION_HISTORY,--预防接种史
		'' AS OPERATION_HISTORY,--手术史
		'' AS BLOOD_HISTORY,--输血史
		'' AS ALLERGY_HISTORY,--过敏史
		'' AS PERSONAL_HISTORY,--个人史
		'' AS OBSTETRICAL_HISTORY,--婚育史
		'' AS MENSTRUAL_HISTORY,--月经史
		'' AS FAMILY_HISTORY,--家族史
		CAST(C7.腋表  AS NUMERIC(4,1))AS TEMPERATURE,
		CAST(C7.心率  AS NUMERIC(4))AS PULSE_RATE,
		CAST(C7.呼吸  AS NUMERIC(3))AS RESPIRATORY_RATE,
		CAST(C8.收缩压 AS NUMERIC(4)) AS SBP,
		CAST(C8.舒张压 AS NUMERIC(4)) AS DBP,
		CAST(C8.身高 AS NUMERIC(5,1))AS HEIGHT,
		CAST(C8.体重 AS NUMERIC(6,2))AS WEIGHT,
		'' AS GENERAL_STATUS_RESULTS,
		'' AS SKIN_CHECK_RESULT,
		'' AS LYMPH_NODE_CHECK_RESULT,
		'' AS HEADITS_ORGAN_EXAM_RESULT,
		'' AS NECK_CHECK_RESULT,
		'' AS CHEST_CHECK_RESULT,
		'' AS ABDOMINAL_CHECK_RESULT,
		'' AS DRE_CHECK_RESULT,
		'' AS EXT_GENITAL_CHECK_ANOMALY,
		'' AS SPINE_CHECK_RESULT,
		'' AS LIMBS_CHECK_RESULT,
		'' AS NERVOUS_CHECK_RESULT,
		'' AS SPECIALIST_STATUS,
		'' AS AE_RESULT,
		'' AS CHINA_FOUR_DIAG_OBSER,
	    NULL AS THERAPEUTIC_THERAPY,
		'' AS THERAPEUTIC_THERAPY_NAME,
		'' AS RECEPTION_DOCTOR_SIG,
		A.住院医师 AS ADMISSION_DOCTOR_SIG,
		A.住院医师 AS ATTENDING_DOCTOR_SIG,
		ISNULL((SELECT TOP 1 X.姓名
FROM    dbo.人员表 X,dbo.部门人员 Y
WHERE X.ID=Y.人员ID AND ( X.专业技术职务 LIKE '副主任医师'
        OR X.专业技术职务 LIKE '主任医师'
        AND X.ID <> 1576)
		AND Y.缺省=1
		AND Y.部门ID=A.入院科室ID ),'-') AS DIRECTOR_DOCTOR_SIGNATURE,
		A.住院号 AS MEDICAL_RECORD_NO,
		B.家庭电话 AS HISTORY_STATEMENT_PHONE,
		CAST(B.家庭地址 AS VARCHAR(100)) HISTORY_STATEMENT_ADDRESS,
		CASE ISNULL(A.入院方式,'9')
		WHEN '门诊' THEN '2' WHEN '急诊' THEN '1' WHEN '其他医疗机构转入' THEN '3' ELSE '9' END AS INHOS_METHOD_CODE,
		A.入院方式 AS INHOS_METHOD_NAME ,
		'01' AS HOS_SYMPTOMS_CODE,
		'' AS HOS_SYMPTOMS,--可以用主诉代替
		NULL AS ATTACK,
		NULL AS START_SYMPTOMS_DATE,
		NULL AS STOP_SYMPTOMS_DATE,
		CASE ISNULL(A.医疗付款方式,'07') WHEN '城乡居民医疗保险'THEN '90'
		WHEN '城镇职工医疗保险'THEN '01'
		WHEN '新型农村合作医疗'THEN '03'
		WHEN '全自费'THEN '07'
		WHEN '全公费'THEN '06'
		WHEN '健康扶贫'THEN '04'
		WHEN '商业医疗保险'THEN '05'
		WHEN '其他社会保险'THEN '02'
		ELSE  '99'END AS MEDICAL_PAY_WAY_CODE,		
		A.医疗付款方式 AS PAY_WAY,
		NULL AS HOS_DISEASE_STATUS_CODE,
		NULL AS HOS_DISEASE_STATUS,
		CASE ISNULL(C9.出院情况,'9') 
		WHEN '治愈' THEN '1'
		WHEN '好转' THEN '2'
		WHEN '稳定' THEN '3'
		WHEN '恶化' THEN '4'
		WHEN '死亡' THEN '5'
		ELSE '9' END  AS TREATMENT_OUTCOME_CODE,
		C9.出院情况 AS TREATMENT_OUTCOME,
		1 AS STRUCT_FLAG,
		NULL AS TEXT_CONTENT,
		NULL AS CONTENT_TYPE,
		A.入院日期 AS CREATE_DATE,
		NULL AS UPDATE_DATE,
		GETDATE() AS UPLOAD_TIME,
		1 AS ESTATUS
	FROM dbo.病案主页 A(NOLOCK)
	LEFT JOIN 病人信息 B ON A.病人ID=B.ID
	LEFT JOIN dbo.部门表 C ON A.入院病区ID=C.ID
	LEFT JOIN dbo.部门表 C2 ON A.入院科室ID=C2.ID
	LEFT JOIN dbo.床位状况记录 C3 ON A.出院病床=C3.床号 AND A.入院病区ID=C3.病区ID
	LEFT JOIN dbo.民族 C4 ON B.民族=C4.名称
	LEFT JOIN dbo.婚姻状况 C5 ON B.婚姻状况=C5.名称
	LEFT JOIN dbo.职业 C6 ON B.职业=C6.名称
	LEFT JOIN dbo.社会关系 H ON B.与患者关系=H.名称
	LEFT JOIN dbo.T_ThreeSingleMeasurement2 C7 ON C7.主页ID = A.主页ID AND A.病人ID=C7.PatientID AND C7.婴儿=0
	AND C7.事件='入院'
	LEFT JOIN dbo.T_ThreeSingleMeasurement C8 ON C8.主页ID = A.主页ID AND A.病人ID=C8.PatientID AND C8.婴儿=0
	AND C8.测量日期=CAST(A.入院日期 AS DATE)
 	LEFT JOIN dbo.病人诊断记录 C9 ON A.病人ID=C9.病人ID AND C9.主页ID=A.主页ID AND C9.诊断类型=3 AND C9.诊断次序=1
	WHERE A.入院日期 BETWEEN  @Date_from  AND @date_to	
END TRY
BEGIN CATCH
INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
VALUES('入院记录',ERROR_MESSAGE(),GETDATE())
END CATCH
---2.2.2.   门诊病历(OUTPATIENT_EMERGENCY_RECORD)
BEGIN TRY
INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,CLINIC_DEPT_CODE,CLINIC_DEPT_NAME,
PATIENT_LOCAL_ID,BUSINESS_LOCAL_ID,REG_SERIAL_NO,OUTPATIENT_NO,VISIT_COUNT,ELECTRONIC_APPLIC_NUM,NAME,
AGE_YEAR,AGE_MONTH,ENDER_CODE,BIRTH_DATE,ALLERGY_HISTORY_CODE,ALLERGY_HISTORY_DETAIL,ALLERGY_HISTORY_FLAG,
ALLERGY_HISTORY,EMERGENCY_OBSERVATION_FLAG,INCIDENCE_DATE,CLINIC_DATE,REASON_FOR_TREATMENT,NEWLY_DIAGNOSED_CODE,
NEWLY_DIAGNOSED_NAME,PRELIM_WESTERN_DIAG_CODE,PRELIM_WESTERN_DIAG_NAME,PRELI_DIAG_TCM_NAME_CODE,
PRELI_DIAG_TCM_NAME_NAME,PRELI_DIAG_TCM_SYNDROME_CODE,PRELI_DIAG_TCM_SYNDROME_NAME,INCOME_OBSERVATION_DATE,
CHIEF_COMPLAINT,PRESENT_HISTORY,PAST_HISTORY,PHYSICAL_EXAMINATION,DISABILITY_STATUS_CODE,SYMPTOM_NAME,
SYMPTOM_CODE,CHINA_FOUR_DIAG_OBSER,AE_ITEM_NAME,AE_RESULT,DIFFERENTIATION_BASED,THERAPEUTIC_THERAPY,
THERAPEUTIC_THERAPY_NAME,EMERGENCY_OBS_COURSE_RECORD,RSU_START_TIME,RSU_END_TIME,EMERGENCY_RESCUE_RECORD,
RECORD_DATE,NOTE,RESCUE_PERSONS,PROFESSIONAL_CATAGORY_CODE,PROFESSIONAL_CATAGORY_NAME,PATIENT_WHEREABOUTS,
DOCTOR_SIGNATURE,DEPT_CODE,CLINIC_DOCTOR_NAME,CUSTODIAN_NAME,DOCTOR_NUMBER,PHYSICIAN_LIABILITY_NAME,
DISPOSAL_OPINIONS,CANCEL_SIGNATURE,MEDI_ADVICE_INF,MEDI_INSTITUTION,MEDI_ORDER_TIME,MED_PRACTI_SIGNATURE,
MEDI_ORDER_CANCEL_TIME,MEDI_ORDER_REVIEW_TIME,MEDI_ORDER_REVIEW_SIG,MEDI_ORDER_TYPE_CODE,MEDI_PROGRAM_CONTENT,
MEDI_ORDER_EXECUTIVE_DEP,MEDI_ORDER_EXECUTIVE_TIME,MEDI_ORDER_EXECUTIVE_SIG,MEDI_ORDER_EXEC_STATUS,STRUCT_FLAG,
TEXT_CONTENT,CONTENT_TYPE,CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS FROM OUTPATIENT_EMERGENCY_RECORD')
SELECT DISTINCT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,CLINIC_DEPT_CODE,CLINIC_DEPT_NAME,
PATIENT_LOCAL_ID,BUSINESS_LOCAL_ID,REG_SERIAL_NO,OUTPATIENT_NO,VISIT_COUNT,ELECTRONIC_APPLIC_NUM,NAME,
AGE_YEAR,AGE_MONTH,ENDER_CODE,BIRTH_DATE,ALLERGY_HISTORY_CODE,ALLERGY_HISTORY_DETAIL,ALLERGY_HISTORY_FLAG,
ALLERGY_HISTORY,EMERGENCY_OBSERVATION_FLAG,INCIDENCE_DATE,CLINIC_DATE,REASON_FOR_TREATMENT,NEWLY_DIAGNOSED_CODE,
NEWLY_DIAGNOSED_NAME,PRELIM_WESTERN_DIAG_CODE,PRELIM_WESTERN_DIAG_NAME,PRELI_DIAG_TCM_NAME_CODE,
PRELI_DIAG_TCM_NAME_NAME,PRELI_DIAG_TCM_SYNDROME_CODE,PRELI_DIAG_TCM_SYNDROME_NAME,INCOME_OBSERVATION_DATE,
CHIEF_COMPLAINT,PRESENT_HISTORY,PAST_HISTORY,PHYSICAL_EXAMINATION,DISABILITY_STATUS_CODE,SYMPTOM_NAME,
SYMPTOM_CODE,CHINA_FOUR_DIAG_OBSER,AE_ITEM_NAME,AE_RESULT,DIFFERENTIATION_BASED,THERAPEUTIC_THERAPY,
THERAPEUTIC_THERAPY_NAME,EMERGENCY_OBS_COURSE_RECORD,RSU_START_TIME,RSU_END_TIME,EMERGENCY_RESCUE_RECORD,
RECORD_DATE,NOTE,RESCUE_PERSONS,PROFESSIONAL_CATAGORY_CODE,PROFESSIONAL_CATAGORY_NAME,PATIENT_WHEREABOUTS,
DOCTOR_SIGNATURE,DEPT_CODE,CLINIC_DOCTOR_NAME,CUSTODIAN_NAME,DOCTOR_NUMBER,PHYSICIAN_LIABILITY_NAME,
DISPOSAL_OPINIONS,CANCEL_SIGNATURE,MEDI_ADVICE_INF,MEDI_INSTITUTION,MEDI_ORDER_TIME,MED_PRACTI_SIGNATURE,
MEDI_ORDER_CANCEL_TIME,MEDI_ORDER_REVIEW_TIME,MEDI_ORDER_REVIEW_SIG,MEDI_ORDER_TYPE_CODE,MEDI_PROGRAM_CONTENT,
MEDI_ORDER_EXECUTIVE_DEP,MEDI_ORDER_EXECUTIVE_TIME,MEDI_ORDER_EXECUTIVE_SIG,MEDI_ORDER_EXEC_STATUS,STRUCT_FLAG,
TEXT_CONTENT,CONTENT_TYPE,CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS FROM(
SELECT  ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,
	    B1.编码 AS CLINIC_DEPT_CODE,
		B1.名称 AS CLINIC_DEPT_NAME,
				 CONCAT(( SELECT ZZJGDM
                 FROM   dbo.T_JGGL
               ), B.病人ID) AS PATIENT_LOCAL_ID ,
		A.ID AS BUSINESS_LOCAL_ID,
		B.ID AS REG_SERIAL_NO,
		B.门诊号 AS OUTPATIENT_NO,
		(SELECT dbo.F_就诊次数(B.病人ID))  AS VISIT_COUNT,
		B.NO AS ELECTRONIC_APPLIC_NUM,
		B2.姓名 AS NAME,
		 CASE WHEN CHARINDEX('岁',B.年龄)<>0 THEN 
		SUBSTRING(b.年龄,0,CHARINDEX('岁',b.年龄)) ELSE 
		'0' END   AS AGE_YEAR,
		CASE WHEN CHARINDEX('月',b.年龄)<>0  AND CHARINDEX('岁',b.年龄)=0 THEN 
		SUBSTRING(b.年龄,0,CHARINDEX('月',b.年龄))
		WHEN CHARINDEX('月',b.年龄)<>0 AND CHARINDEX('岁',b.年龄)<>0 THEN 
		dbo.SubStr(SUBSTRING(b.年龄,0, CHARINDEX('月',b.年龄)),CHARINDEX('岁',b.年龄)+1) ELSE 
		'0' END  AS AGE_MONTH,
		CASE B2.性别
          WHEN '男' THEN '1'
          WHEN '女' THEN '2'
          WHEN '未知' THEN '0'
          ELSE '9'
        END AS ENDER_CODE ,
		B2.出生日期 AS BIRTH_DATE,
		CASE WHEN CHARINDEX('青霉', B3.药物名)<>0 THEN '101'
		WHEN CHARINDEX('头孢', B3.药物名)<>0 THEN '103'
		WHEN CHARINDEX('阿莫西林', B3.药物名)<>0 THEN '101'
		ELSE NULL END  AS ALLERGY_HISTORY_CODE,--101 青霉素、103头孢
		B3.药物名 AS ALLERGY_HISTORY_DETAIL,
		CASE (SELECT COUNT(*) FROM dbo.病人过敏记录 WHERE A.PatientID=病人ID) 
		WHEN '0' THEN '无' ELSE '有' END AS ALLERGY_HISTORY_FLAG,
		'' AS ALLERGY_HISTORY,
		'2' AS EMERGENCY_OBSERVATION_FLAG,--是否留观
		B.发病时间 AS INCIDENCE_DATE,
		B.执行时间 AS CLINIC_DATE,
		'' AS REASON_FOR_TREATMENT,--就诊原因
		CASE B.复诊 WHEN '0' THEN '1' ELSE '2' END AS NEWLY_DIAGNOSED_CODE,--DE06.00.196.00
		CASE B.复诊 WHEN '0' THEN '初诊' ELSE '复诊' END AS NEWLY_DIAGNOSED_NAME,
		( SELECT    data = STUFF(( SELECT   '#' + [T].[诊断ID]
                                   FROM     病人诊断记录 T
                                   WHERE    A.PatientID = T.病人ID
                                            AND A.主页ID = T.主页ID
                                 FOR
                                   XML PATH('')
                                 ), 1, 1, '')) AS PRELIM_WESTERN_DIAG_CODE,--西医诊断
		( SELECT    data = STUFF(( SELECT   '，' + [T].[诊断描述]
                                   FROM     病人诊断记录 T
                                   WHERE    A.PatientID = T.病人ID
                                            AND A.主页ID = T.主页ID
                                 FOR
                                   XML PATH('')
                                 ), 1, 1, '')) AS  PRELIM_WESTERN_DIAG_NAME,
		NULL AS PRELI_DIAG_TCM_NAME_CODE,
		NULL AS PRELI_DIAG_TCM_NAME_NAME,
		NULL AS PRELI_DIAG_TCM_SYNDROME_CODE,
		NULL AS PRELI_DIAG_TCM_SYNDROME_NAME,
		NULL AS INCOME_OBSERVATION_DATE,
		(SELECT CAST(value AS VARCHAR(100)) FROM dbo.Fn_OutPatinetElement(B.病人ID,B.NO) WHERE Name='主诉') AS  CHIEF_COMPLAINT,-- 主诉 
		'' AS  PRESENT_HISTORY,--现病史
		'' AS  PAST_HISTORY,--既往史
		'' AS PHYSICAL_EXAMINATION,--体格检查
		NULL AS DISABILITY_STATUS_CODE,--残疾情况代码
		'其他' AS SYMPTOM_NAME,
		'0425' AS SYMPTOM_CODE,--必填 CV5101.27
		NULL AS CHINA_FOUR_DIAG_OBSER,
		NULL AS AE_ITEM_NAME,--辅助检查项目
		NULL AS AE_RESULT,--辅助检查结果
		NULL AS DIFFERENTIATION_BASED,--辨证依据
		NULL AS THERAPEUTIC_THERAPY,--治则治法
		NULL AS THERAPEUTIC_THERAPY_NAME,--治则治法描述
		'无' AS EMERGENCY_OBS_COURSE_RECORD,--急诊留观病程记录
		NULL AS RSU_START_TIME,--抢救开始日期时间
		NULL AS RSU_END_TIME,--抢救结束日期时间
		NULL AS EMERGENCY_RESCUE_RECORD,--急诊抢救记录
		NULL AS RECORD_DATE,--记录日期时间
		NULL AS NOTE,--注意事项
		NULL AS RESCUE_PERSONS,--参加抢救人员名单
		NULL AS PROFESSIONAL_CATAGORY_CODE,--专业技术职务类别代码
		NULL AS PROFESSIONAL_CATAGORY_NAME,--专业技术职务类别名称
		NULL AS PATIENT_WHEREABOUTS,--患者去向
		NULL AS DOCTOR_SIGNATURE,--医师签名
		NULL AS DEPT_CODE,--科室标识
		B.执行人 AS CLINIC_DOCTOR_NAME,
		NULL AS CUSTODIAN_NAME,
		B4.GH AS DOCTOR_NUMBER,--责任医师职工编号
		B.执行人 AS PHYSICIAN_LIABILITY_NAME,
		NULL AS DISPOSAL_OPINIONS,--处置意见
		NULL AS CANCEL_SIGNATURE,--取消医嘱者签名
		NULL AS MEDI_ADVICE_INF,--医嘱备注信息
		B1.编码 AS MEDI_INSTITUTION,--医嘱开立科室
		B5.开嘱时间 AS MEDI_ORDER_TIME,
		B5.开嘱医生 AS MED_PRACTI_SIGNATURE,
		NULL AS MEDI_ORDER_CANCEL_TIME,--医嘱取消日期时间
		NULL AS MEDI_ORDER_REVIEW_TIME,--医嘱审核日期时间
		B5.开嘱医生 AS MEDI_ORDER_REVIEW_SIG,--医嘱审核者签名
		NULL AS MEDI_ORDER_TYPE_CODE,
		B5.医嘱内容 AS MEDI_PROGRAM_CONTENT,
		B6.编码 AS  MEDI_ORDER_EXECUTIVE_DEP,
		B5.开始执行时间 AS MEDI_ORDER_EXECUTIVE_TIME,
		C2.执行人 AS MEDI_ORDER_EXECUTIVE_SIG,--医嘱执行者签名
		NULL AS MEDI_ORDER_EXEC_STATUS,
		1 AS STRUCT_FLAG,
		NULL AS TEXT_CONTENT,
		NULL AS CONTENT_TYPE,
		A.CreateDate AS CREATE_DATE,
		NULL AS UPDATE_DATE,
		GETDATE() AS UPLOAD_TIME,
		1 AS ESTATUS
FROM  YTDOC.dbo.T_DocList A(NOLOCK),
      dbo.病人挂号记录 B (NOLOCK)
	  LEFT JOIN dbo.部门表 B1 ON B.执行部门ID=B1.ID
	  LEFT JOIN 病人信息 B2(NOLOCK) ON B.病人ID=B2.ID
	  LEFT JOIN dbo.病人过敏记录 B3(NOLOCK) ON B.病人ID=B3.病人ID AND B.ID=B3.主页ID
	  LEFT JOIN dbo.T_UserDB B4 (NOLOCK)ON B.执行人=B4.XM
	  LEFT JOIN 病人医嘱记录 B5(NOLOCK) ON B.病人ID=B5.病人ID AND B.NO=B5.挂号单 
	  LEFT JOIN dbo.门诊费用记录 C2 (NOLOCK)ON B5.ID=C2.医嘱序号
	  LEFT JOIN dbo.部门表 B6 ON B5.执行科室ID=B6.ID
WHERE
  A.PatientID=B.病人ID AND A.挂号单=B.NO 
  AND B.发生时间  BETWEEN @Date_from  AND @date_to	
  AND C2.执行人 IS NOT NULL
) M WHERE M.CHIEF_COMPLAINT IS NOT NULL AND LEN(M.CHIEF_COMPLAINT)>0
END TRY
BEGIN CATCH
INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
VALUES('门诊病历',ERROR_MESSAGE(),GETDATE())
END CATCH
--2.12.2    阴道分娩记录(VBNC_RECORD)
BEGIN TRY
INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,CLINIC_DEPT_CODE,CLINIC_DEPT_NAME,PATIENT_LOCAL_ID,
BUSINESS_LOCAL_ID,BUSINESS_ID,MEDICAL_RECORD_NO,INPATIENT_NO,VISIT_COUNT,WARD_NUM,BED_NUM,MATERNAL_NAME,AGE_YEAR,
PREGNANCY_TIMES,PARITY,LAST_MENSTRUAL_PERIOD,PRE_DATE,EXPECTANT_DATETIME,DELIVERY_DATETIME,ADMISSION_DIAGNOSIS,CONTRACTIONS,
MEMBRANES_RUPTURE_PERIOD_TIME,TIRE_AZIMUTH_CODE,TIRE_AZIMUTH_NAME,FORMER_AMNIOTIC_FLUID_CHARACT,FORMER_AMNIOTIC_FLUID_DESC,
FIRST_DURATION_LABOR,PALACE_OPENFULL_DATETIME,SECOND_PRODUCTION_PROCESS,THIRD_DURATION_LABOR,DURATION_LABOR,VAGINA_DELIVERY_FLAG,
VAGINA_DELIVERY_METHOD,AMNIOTIC_FLUID_PROPERTIES,PLACENTA_DELIVERY_DATETIME,PLACENTA_DELIVERY_SITUATION,INTRAPARTUM_TREATMENT,
PRECAUTION,MATERNAL_EPISIOTOMY_FLAG,EPISIOTOMY_LOCATION,MATERNAL_PER_SUTURE_NEEDLES,PERINEAL_LACERAT_SITUAT_CODE,
PERINEAL_LACERATION_CASES,PERINEAL_HEMATOMA_FLAG,ANESTHESIA_METHOD_CODE,ANESTHESIA_METHOD,ANESTHESIA_DRUG_NAME,
VAGINAL_LACERATION_FLAG,VAGINAL_HEMATOMA_FLAG,VAGINAL_HEMATOMA_SIZE,DETAIL_DISPOSE,IS_LACERATION,SUTURE_DETAIL,
ANAL_INVESTIGATION,POSTPARTUM_MEDICATION,DELIVERY_PROCESS_SPECIAL_DES,UTERINE_STATUS,ELU_STATUS,REPAIR_PROCEDURE,
POSTPARTUM_DIAGNOSIS,POSTPARTUM_OBSERVATION_DATE,POSTPARTUM_CHECK_TIME,POSTPARTUM_SYSTOLIC_PRESSURE,
POSTPARTUM_DIASTOLIC_PRESSURE,POSTPARTUM_PULSE,POSTPARTUM_HEART_RATE,POSTPARTUM_HEMORRHAGE_VOLUME,POSTPARTUM_CONTRACTION,
POSTPARTUM_PALACE_FLOOR_HEIGHT,POSTPARTUM_BLADDER_FILL_FLAG,APGAR_SCORE_INTERVAL_CODE,APGAR_SCORE_INTERVAL,APGAR_SCORE,
DELIVERY_OUTCOME_CODE,DELIVERY_OUTCOME_NAME,DELIVERY_STAFF_SIGNATURE,DOCTOR_SIGNATURE,PEDIATRICIAN_SIGNATURE,RECORDER_SIG,
STRUCT_FLAG,TEXT_CONTENT,CONTENT_TYPE,CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS FROM VBNC_RECORD')
SELECT * FROM(
SELECT  ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,		 
		B2.编码 AS CLINIC_DEPT_CODE,
		B2.名称 AS CLINIC_DEPT_NAME,
		CONCAT(( SELECT ZZJGDM
                 FROM   dbo.T_JGGL
               ), B.病人ID) AS PATIENT_LOCAL_ID ,
		(SELECT TOP 1 ID FROM YTDOC.DBO.T_DocList WHERE PatientID=B.病人ID AND 主页ID=B.主页ID AND Title LIKE '%入院记录%') AS BUSINESS_LOCAL_ID,
		B4.病历ID AS BUSINESS_ID,
		B.住院号 AS MEDICAL_RECORD_NO,
		B.住院号 AS INPATIENT_NO,
		B.主页ID AS VISIT_COUNT,
		B3.房间号 AS WARD_NUM,
		B.出院病床 AS BED_NUM,
		C.姓名 AS MATERNAL_NAME,
		DATEDIFF(YEAR, C.出生日期,B.入院日期) AS AGE_YEAR,
		B4.孕次  AS PREGNANCY_TIMES,
		B4.产次  AS PARITY,
		(SELECT CAST(value AS VARCHAR(100)) FROM dbo.Fn_待产记录(b.病人ID,b.主页ID) WHERE Name='末次月经') AS LAST_MENSTRUAL_PERIOD,
		(SELECT CAST(value AS VARCHAR(100)) FROM dbo.Fn_待产记录(b.病人ID,b.主页ID) WHERE Name='预产期')  AS PRE_DATE,
		NULL AS EXPECTANT_DATETIME,
		(SELECT CAST(value AS VARCHAR(100)) FROM dbo.Fn_待产记录(b.病人ID,b.主页ID) WHERE Name='产程开始') AS DELIVERY_DATETIME,
		E.诊断描述 AS ADMISSION_DIAGNOSIS,
		NULL AS CONTRACTIONS,--宫缩情况
		B4.破膜时间 AS MEMBRANES_RUPTURE_PERIOD_TIME,--破膜时间
		CASE B4.胎方位 
	    WHEN  'LOA' THEN '01'
					   WHEN 'ROA' THEN  '02'
					   WHEN 'LSA' THEN  '13'
					   WHEN 'RSA' THEN  '14' 
					   WHEN 'LOP' THEN  '03'
					   END   AS TIRE_AZIMUTH_CODE,
		B4.胎方位   AS TIRE_AZIMUTH_NAME,
		B4.羊水性状    AS FORMER_AMNIOTIC_FLUID_CHARACT,
		B4.羊水量   AS FORMER_AMNIOTIC_FLUID_DESC,
		B4.第一产程   AS FIRST_DURATION_LABOR,
		B4.宫口开全时间   AS PALACE_OPENFULL_DATETIME,
		B4.第二产程    AS SECOND_PRODUCTION_PROCESS,
		B4.第三产程    AS THIRD_DURATION_LABOR,
		B4.总产程    AS DURATION_LABOR,
		1 AS VAGINA_DELIVERY_FLAG,--阴道产
		NULL AS VAGINA_DELIVERY_METHOD,--助产方式
		B4.分娩羊水性状   AS AMNIOTIC_FLUID_PROPERTIES,
		B4.胎儿娩出时间   AS PLACENTA_DELIVERY_DATETIME,
		NULL AS PLACENTA_DELIVERY_SITUATION,
		NULL AS INTRAPARTUM_TREATMENT,
		NULL AS PRECAUTION,
		NULL AS MATERNAL_EPISIOTOMY_FLAG,
		NULL AS EPISIOTOMY_LOCATION,
		NULL AS MATERNAL_PER_SUTURE_NEEDLES,
		NULL AS PERINEAL_LACERAT_SITUAT_CODE,
		NULL AS PERINEAL_LACERATION_CASES,
		NULL AS PERINEAL_HEMATOMA_FLAG,
		NULL AS ANESTHESIA_METHOD_CODE,
		NULL AS ANESTHESIA_METHOD,
		NULL AS ANESTHESIA_DRUG_NAME,
		NULL AS VAGINAL_LACERATION_FLAG,
		NULL AS VAGINAL_HEMATOMA_FLAG,
		NULL AS VAGINAL_HEMATOMA_SIZE,
		NULL AS DETAIL_DISPOSE,
		NULL AS IS_LACERATION,
		NULL AS SUTURE_DETAIL,
		NULL AS ANAL_INVESTIGATION,
		NULL AS POSTPARTUM_MEDICATION,
		NULL AS DELIVERY_PROCESS_SPECIAL_DES,
		NULL AS UTERINE_STATUS,
		NULL AS ELU_STATUS,
		NULL AS REPAIR_PROCEDURE,
		B4.产后诊断 AS POSTPARTUM_DIAGNOSIS,
		NULL AS POSTPARTUM_OBSERVATION_DATE,
		NULL AS POSTPARTUM_CHECK_TIME,
		NULL AS POSTPARTUM_SYSTOLIC_PRESSURE,
		NULL AS POSTPARTUM_DIASTOLIC_PRESSURE,
		NULL AS POSTPARTUM_PULSE,
		NULL AS POSTPARTUM_HEART_RATE,
		NULL AS POSTPARTUM_HEMORRHAGE_VOLUME,
		NULL AS POSTPARTUM_CONTRACTION,
		NULL AS POSTPARTUM_PALACE_FLOOR_HEIGHT,
		NULL AS POSTPARTUM_BLADDER_FILL_FLAG,
		'1' AS APGAR_SCORE_INTERVAL_CODE,
		'1分钟' AS APGAR_SCORE_INTERVAL,
		B4.一分钟评分  AS APGAR_SCORE,
		NULL AS DELIVERY_OUTCOME_CODE,--分娩结局代码 DE06.00.026.00
		NULL AS DELIVERY_OUTCOME_NAME,--分娩结果
		B4.接生者  AS DELIVERY_STAFF_SIGNATURE,--接生人员签名
		B4.手术医师  AS DOCTOR_SIGNATURE,--手术医生签名
		B4.儿科医生 AS PEDIATRICIAN_SIGNATURE,--儿科医生签名
		B4.记录人  AS RECORDER_SIG,--记录人员签名
		1 AS STRUCT_FLAG,
		NULL AS TEXT_CONTENT,
		NULL AS CONTENT_TYPE,
		B4.创建时间 AS CREATE_DATE,
	    NULL AS UPDATE_DATE,
	    GETDATE() AS UPLOAD_TIME,
	    1 AS ESTATUS
FROM  dbo.病案主页 B 
LEFT JOIN dbo.病人诊断记录 E ON B.病人ID=E.病人ID AND E.主页ID=B.主页ID AND E.诊断类型=1
LEFT JOIN 病人信息 C ON b.病人ID=C.ID
LEFT JOIN dbo.部门表 B2 ON B.出院科室ID=B2.ID
LEFT JOIN dbo.床位状况记录 B3 ON B.当前病区ID=B3.病区ID AND B.出院病床=B3.床号,
(SELECT 病人ID,主页ID ,病历ID,创建时间,
MAX(孕次)孕次,
MAX(产次)产次,
MAX(产程开始)产程开始,
MAX(破膜时间)破膜时间,
MAX(胎方位) 胎方位,
MAX(羊水量) 羊水量,
MAX(羊水性状)羊水性状,
MAX(分娩羊水性状)分娩羊水性状,
MAX(宫口开全时间)宫口开全时间,
MAX(第一产程)第一产程,
MAX(第二产程)第二产程,
MAX(第三产程)第三产程,
MAX(总产程) 总产程,
MAX(胎儿娩出时间)胎儿娩出时间,
MAX(脉搏)脉搏,
MAX(收缩压) 收缩压,
MAX(舒张压) 舒张压,
MAX(接生者) 接生者,
MAX(记录人) 记录人,
MAX(手术医师)手术医师,
MAX(儿科医生)儿科医生,
MAX(一分钟评分)一分钟评分,
MAX(五分钟评分)五分钟评分,
MAX(十分钟评分)十分钟评分,
MAX(宫底高度)宫底高度,
MAX(产后诊断)产后诊断 
FROM dbo.Fn_分娩记录平产(@Date_from, @date_to) GROUP BY 病人ID,主页ID,病历ID,创建时间 ) AS B4  
WHERE  B.病人ID=B4.病人ID AND B.主页ID=B4.主页ID
       AND B.入院日期 BETWEEN  DATEADD(DAY,-15,@Date_from)   AND @date_to	
 )M WHERE LEN(M.DELIVERY_STAFF_SIGNATURE)>0
 AND LEN(DOCTOR_SIGNATURE)>0
 AND LEN(PEDIATRICIAN_SIGNATURE)>0
 AND LEN(RECORDER_SIG)>0
 AND NOT EXISTS(
 SELECT * FROM 
 (
  SELECT TOP 50 BUSINESS_ID FROM OPENQUERY(YT,'SELECT  BUSINESS_ID FROM VBNC_RECORD ORDER BY CREATE_DATE DESC ')
  )M2 WHERE M.BUSINESS_ID=M2.BUSINESS_ID
 )  
END TRY
BEGIN CATCH
INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
VALUES('阴道分娩记录',ERROR_MESSAGE(),GETDATE())
END CATCH
--2.12.4.   新生儿分娩记录(SECTION_NB_RECORD)（优先级1） 
BEGIN TRY
INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,CLINIC_DEPT_CODE,CLINIC_DEPT_NAME,DETAILS_LOCAL_ID,
BUSINESS_LOCAL_ID,PATIENT_LOCAL_ID,INPATIENT_NO,VISIT_COUNT,DELIVERY_DATETIME,FETAL_MEMBRANE_INTEGRITY_FLAG,
AMONG_THE_BAND_LENGTH,AROUND_THE_NECK,UMBILICAL_CORD_ABNORMALITIES,SAVE_CORD_BLOOD_FLAG,NEONATAL_ABNORMAL_CODE,
NEONATAL_ABNORMAL,NEONATAL_GENDER_CODE,NEONATAL_GENDER,NEONATAL_WEIGHT,NEONATAL_HEIGHT,TUMOUR_SIZE,TUMOUR_PARTS,
STRUCT_FLAG,TEXT_CONTENT,CONTENT_TYPE,CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS FROM SECTION_NB_RECORD')
SELECT * FROM(
SELECT  ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,
        B2.编码 AS CLINIC_DEPT_CODE ,
        B2.名称 AS CLINIC_DEPT_NAME ,
        A.序号 AS DETAILS_LOCAL_ID ,--新生儿分娩序号
        D.病历ID AS BUSINESS_LOCAL_ID ,
        CONCAT(( SELECT ZZJGDM
                 FROM   dbo.T_JGGL
               ), B.病人ID) AS PATIENT_LOCAL_ID ,
        B.住院号 AS INPATIENT_NO ,
        B.主页ID AS VISIT_COUNT ,
        CASE WHEN ISDATE(D.胎儿娩出时间)=0 THEN NULL ELSE D.胎儿娩出时间 END  AS DELIVERY_DATETIME ,
        NULL AS FETAL_MEMBRANE_INTEGRITY_FLAG ,
        CAST(CASE  WHEN LEN(D.脐带长度)<>0 THEN D.脐带长度 END AS numeric(5)) AS AMONG_THE_BAND_LENGTH ,
        CAST(CASE  WHEN LEN(D.绕颈)<>0 THEN D.绕颈 END AS numeric(3)) AS AROUND_THE_NECK ,
        NULL AS UMBILICAL_CORD_ABNORMALITIES ,
        NULL AS SAVE_CORD_BLOOD_FLAG ,
        CASE D.新生儿异常 
		WHEN '无' THEN '1' 
		WHEN '早期新生儿死亡' THEN '2' 
		WHEN '畸形' THEN '3' 
		WHEN '早产' THEN '4' 
	    WHEN '窒息' THEN '5'
		WHEN '低出生体重' THEN '6'  
		ELSE '9' END AS NEONATAL_ABNORMAL_CODE ,
        D.新生儿异常 AS NEONATAL_ABNORMAL ,
        CASE A.婴儿性别 WHEN '男' THEN '1' WHEN '女' THEN '2' ELSE '0' END
		 AS NEONATAL_GENDER_CODE ,
        A.婴儿性别 AS NEONATAL_GENDER ,
        CAST(CASE  WHEN LEN(D.体重)<>0 THEN D.体重 END AS numeric(4)) AS NEONATAL_WEIGHT ,
        CAST(CASE  WHEN LEN(D.身长)<>0 THEN D.身长 END AS numeric(5,1)) NEONATAL_HEIGHT ,
        NULL AS TUMOUR_SIZE ,
        NULL AS TUMOUR_PARTS ,
        1 AS STRUCT_FLAG ,
        CAST(D2.NR AS TEXT) AS TEXT_CONTENT ,
        NULL AS CONTENT_TYPE ,
        A.出生时间 AS CREATE_DATE ,
        NULL AS UPDATE_DATE ,
        GETDATE() AS UPLOAD_TIME ,
        1 AS ESTATUS
FROM    dbo.病人新生儿记录 A
        LEFT JOIN dbo.病案主页 B ON A.病人ID = B.病人ID
                                AND A.主页ID = B.主页ID
        LEFT JOIN dbo.病人信息 C ON A.病人ID = C.ID
        LEFT JOIN dbo.部门表 B2 ON B.出院科室ID = B2.ID
        LEFT JOIN dbo.床位状况记录 B3 ON B.当前病区ID = B3.病区ID
                                   AND B.出院病床 = B3.床号 ,
        ( SELECT    病人ID ,
                    主页ID ,
                    病历ID ,
                    创建时间 ,
                    MAX(胎儿娩出时间) 胎儿娩出时间 ,
                    MAX(脐带长度) 脐带长度 ,
                    MAX(绕颈) 绕颈 ,
                    MAX(新生儿异常) 新生儿异常 ,
                    MAX(性别) 性别 ,
                    MAX(体重) 体重 ,
                    MAX(身长) 身长
          FROM      dbo.Fn_婴儿记录element( DATEADD(DAY,-15,@Date_from)  , @date_to	)
		  GROUP BY  病人ID ,
                    主页ID ,
                    病历ID ,
                    创建时间 
        ) D LEFT JOIN
		YTDOC.dbo.T_DocList D2 ON  D.病历ID=D2.ID
WHERE   A.病人ID = D.病人ID
        AND A.主页ID = D.主页ID	
)M
 WHERE NOT EXISTS(
 SELECT * FROM 
 (SELECT TOP 100 BUSINESS_LOCAL_ID FROM OPENQUERY(YT,'SELECT BUSINESS_LOCAL_ID FROM SECTION_NB_RECORD 
 ORDER BY CREATE_DATE DESC'))M2 WHERE M.BUSINESS_LOCAL_ID=M2.BUSINESS_LOCAL_ID
 )
END TRY
BEGIN CATCH
INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
VALUES('新生儿分娩记录',ERROR_MESSAGE(),GETDATE())
END CATCH 
--2.12.3.	宫剖产记录(CAESAREAN_SECTION_RECORD)（优先级1）
BEGIN TRY
 INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,CLINIC_DEPT_CODE,CLINIC_DEPT_NAME,PATIENT_LOCAL_ID,
 BUSINESS_LOCAL_ID,BUSINESS_ID,MEDICAL_RECORD_NO,INPATIENT_NO,VISIT_COUNT,WARD_NUM,BED_NUM,MATERNAL_NAME,AGE_YEAR,
 EXPECTANT_DATETIME,PREOPERATIVE_DIAGNOSTIC_NAME,OPERATION_INDICATION,OPERATION_CODE,OPERATION_NAME,
 OPERATION_START_DATETIME,ANESTHESIA_METHOD_CODE,ANESTHESIA_METHOD,ANESTHESIA_TARGET,ANESTHESIA,
 CAESAREAN_SECTION_OPERATION,UTERINE_STATUS,FETAL_CHILDBIRTH_WAY,AMNIOTIC_FLUID_PROPERTIES,AMNIOTIC_FLUID_VOLUME,
 PLACENTA_DELIVERY_SITUATION,UTERINE_WALL_SUTURE,UTEROTONICS_NAME,UTEROTONICS_METHOD,OPERATION_TREATMENT,
 OPERATION_DOSAGE,ABDOMINAL_EXPLORATION_UTERUS,ABDOMINAL_EXPLORATION_ANNEX,INTRAUTER_EXPLORAT_ANOMALIES,
 INTRAUTERINE_EXPLORAT_TREAT,OPERATIVE_MATERNAL_CONDITION,BLEEDING_AMOUNT,TRANSFUSION_CONSTITUENTS,RBC,
 BLOOD_PLATELET,PLASMA,WHOLE_BLOOD,BLOOD_RECEIVE,FLUID_VOLUME,OXYGEN_TIME,OTHER_DRUGS,OTHER_MEDICATIONS,
 OPERATION_END_DATETIME,OPERATION_FULL_TIME,POSTOPERATIVE_DIAGNOSIS_NAME,POSTOPERATIVE_OBSER_TIME,
 POSTOPERATIVE_CHECK_TIME,POSTPARTUM_SYSTOLIC_PRESSURE,POSTPARTUM_DIASTOLIC_PRESSURE,POSTPARTUM_PULSE,
 POSTPARTUM_HEART_RATE,POSTOPERAT_HEMORRHAGE_VOLUME,POSTOPERAT_UTERINE_CONTRACT,POSTOPER_PALACE_FLOOR_HEIGHT,
 APGAR_SCORE_INTERVAL_CODE,APGAR_SCORE,DELIVERY_OUTCOME_CODE,DELIVERY_OUTCOME_NAME,DOCTOR_SIGNATURE,
 ANESTHESIA_DOCTOR_SIGNATURE,EQUIPMENT_NURSES_SIGNATURE,OPERATIVE_ASSISTANT_SIGNATURE,PEDIATRICIAN_SIGNATURE,
 RECORDER_SIG,STRUCT_FLAG,TEXT_CONTENT,CONTENT_TYPE,CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS
   FROM CAESAREAN_SECTION_RECORD')
SELECT * FROM(
SELECT  ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,		 
		B2.编码 AS CLINIC_DEPT_CODE,
		B2.名称 AS CLINIC_DEPT_NAME,
		CONCAT(( SELECT ZZJGDM
                 FROM   dbo.T_JGGL
               ), B.病人ID) AS PATIENT_LOCAL_ID ,
		(SELECT TOP 1 ID FROM YTDOC.DBO.T_DocList WHERE PatientID=B.病人ID AND 主页ID=B.主页ID AND Title LIKE '%入院记录%')AS BUSINESS_LOCAL_ID,
		B4.病历ID AS BUSINESS_ID,
		B.住院号 AS MEDICAL_RECORD_NO,
		B.住院号 AS INPATIENT_NO,
		B.主页ID AS VISIT_COUNT,
		B3.房间号 AS WARD_NUM,
		B.出院病床 AS BED_NUM,
		C.姓名 AS MATERNAL_NAME,
		DATEDIFF(YEAR, C.出生日期,B.入院日期) AS AGE_YEAR,
		B4.待产时间 AS EXPECTANT_DATETIME,
		B4.术前诊断 AS PREOPERATIVE_DIAGNOSTIC_NAME,
		NULL AS OPERATION_INDICATION,
		NULL AS OPERATION_CODE,
		NULL AS OPERATION_NAME,
		B4.手术开始时间 AS OPERATION_START_DATETIME,
		NULL AS ANESTHESIA_METHOD_CODE,
		NULL AS ANESTHESIA_METHOD,
		NULL AS ANESTHESIA_TARGET,
		NULL AS ANESTHESIA,
		NULL AS CAESAREAN_SECTION_OPERATION,
		NULL AS UTERINE_STATUS,
		b4.分娩方式 AS FETAL_CHILDBIRTH_WAY,
		B4.羊水性状 AS AMNIOTIC_FLUID_PROPERTIES,
		CASE WHEN LEN(b4.羊水量)>0 then b4.羊水量 else null end AS AMNIOTIC_FLUID_VOLUME,
		NULL AS PLACENTA_DELIVERY_SITUATION ,
		NULL AS UTERINE_WALL_SUTURE,
		NULL AS UTEROTONICS_NAME,
		NULL AS UTEROTONICS_METHOD,
		NULL AS OPERATION_TREATMENT,
		NULL AS OPERATION_DOSAGE,
		NULL AS ABDOMINAL_EXPLORATION_UTERUS,
		NULL AS ABDOMINAL_EXPLORATION_ANNEX,
		NULL AS INTRAUTER_EXPLORAT_ANOMALIES,
		NULL AS INTRAUTERINE_EXPLORAT_TREAT,
		NULL AS OPERATIVE_MATERNAL_CONDITION,
		NULL AS BLEEDING_AMOUNT,
		NULL AS TRANSFUSION_CONSTITUENTS,
		NULL AS RBC ,
		NULL AS BLOOD_PLATELET,
		NULL AS PLASMA,
		NULL AS WHOLE_BLOOD,
		NULL AS BLOOD_RECEIVE,
		NULL AS FLUID_VOLUME,
		NULL AS OXYGEN_TIME,
		NULL AS OTHER_DRUGS,
		NULL AS OTHER_MEDICATIONS,
		B4.手术结束时间 AS OPERATION_END_DATETIME,
		NULL AS OPERATION_FULL_TIME,
		B4.术后诊断 AS POSTOPERATIVE_DIAGNOSIS_NAME,
		NULL AS POSTOPERATIVE_OBSER_TIME,
        NULL AS POSTOPERATIVE_CHECK_TIME,
		 cast(b4.收缩压 as numeric(3))  AS POSTPARTUM_SYSTOLIC_PRESSURE,
		 cast(b4.舒张压 as numeric(3))  AS POSTPARTUM_DIASTOLIC_PRESSURE,
		 cast(b4.脉搏 as numeric(3))  AS POSTPARTUM_PULSE,
		 cast(b4.心率 as numeric(3)) AS POSTPARTUM_HEART_RATE,
		NULL AS POSTOPERAT_HEMORRHAGE_VOLUME,
		NULL AS POSTOPERAT_UTERINE_CONTRACT,
        NULL AS POSTOPER_PALACE_FLOOR_HEIGHT,
		'1' AS APGAR_SCORE_INTERVAL_CODE,
	    B4.一分钟评分 AS APGAR_SCORE,
		NULL AS DELIVERY_OUTCOME_CODE,
		NULL AS DELIVERY_OUTCOME_NAME,
		B4.手术医师 AS DOCTOR_SIGNATURE,--手术医生签名
		B4.麻醉医师 AS ANESTHESIA_DOCTOR_SIGNATURE,--麻醉医生签名
		B4.器械护士 AS EQUIPMENT_NURSES_SIGNATURE,--器械护士签名
		B4.手术助手 AS OPERATIVE_ASSISTANT_SIGNATURE,--手术助手签名
		B4.儿科医生 AS PEDIATRICIAN_SIGNATURE,--儿科医生签名
		B4.记录人 AS RECORDER_SIG,--记录人员签名
		1 AS STRUCT_FLAG,
		CAST(B5.NR AS TEXT) AS TEXT_CONTENT,
		NULL AS CONTENT_TYPE,
		B4.创建时间 AS CREATE_DATE,
	    NULL AS UPDATE_DATE,
	    GETDATE() AS UPLOAD_TIME,
	    1 AS ESTATUS
FROM  dbo.病案主页 B 
LEFT JOIN 病人信息 C ON B.病人ID=C.ID
LEFT JOIN dbo.部门表 B2 ON B.出院科室ID=B2.ID
LEFT JOIN dbo.床位状况记录 B3 ON B.当前病区ID=B3.病区ID AND B.出院病床=B3.床号,
(SELECT 病人ID,主页ID ,病历ID,创建时间,
MAX(待产时间)待产时间,
MAX(术前诊断)术前诊断,
MAX(手术编码)手术编码,
MAX(手术名称)手术名称,
MAX(手术开始时间)手术开始时间,
MAX(手术结束时间)手术结束时间,
MAX(分娩方式) 分娩方式,
MAX(羊水量) 羊水量,
MAX(羊水性状)羊水性状,
MAX(破膜时间)破膜时间,
MAX(胎盘娩出时间)胎盘娩出时间,
MAX(脉搏)脉搏,
MAX(心率)心率,
MAX(收缩压) 收缩压,
MAX(舒张压) 舒张压,
MAX(器械护士) 器械护士,
MAX(麻醉医师) 麻醉医师,
MAX(记录人) 记录人,
MAX(手术医师)手术医师,
MAX(儿科医生)儿科医生,
MAX(手术助手)手术助手,
MAX(一分钟评分)一分钟评分,
MAX(五分钟评分)五分钟评分,
MAX(十分钟评分)十分钟评分,
MAX(术后诊断)术后诊断 
FROM dbo.Fn_分娩记录宫剖产(DATEADD(DAY,-15,@Date_from)  , @date_to) GROUP BY 病人ID,主页ID,病历ID,创建时间 ) AS B4 
LEFT JOIN YTDOC.dbo.T_DocList B5 ON B4.病历ID=B5.ID
WHERE  B.病人ID=B4.病人ID AND B.主页ID=B4.主页ID
)M   WHERE 
len(DOCTOR_SIGNATURE)>0
and len(ANESTHESIA_DOCTOR_SIGNATURE)>0
and len(EQUIPMENT_NURSES_SIGNATURE)>0
and len(OPERATIVE_ASSISTANT_SIGNATURE)>0
and len(PEDIATRICIAN_SIGNATURE)>0
and len(RECORDER_SIG)>0
AND NOT EXISTS(
 SELECT * FROM 
 (SELECT TOP 50 BUSINESS_ID FROM OPENQUERY(YT,'SELECT BUSINESS_ID FROM CAESAREAN_SECTION_RECORD 
 ORDER BY CREATE_DATE DESC'))M2 WHERE M.BUSINESS_ID=M2.BUSINESS_ID
 )
 END TRY
 BEGIN CATCH
 INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
 VALUES('宫剖产记录',ERROR_MESSAGE(),GETDATE())
 END CATCH
--2.12.1.	待产记录(EXPECTANT_RECORD)（优先级1）
BEGIN TRY
 INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,CLINIC_DEPT_CODE,CLINIC_DEPT_NAME,PATIENT_LOCAL_ID,
BUSINESS_LOCAL_ID,MEDICAL_RECORD_NO,INPATIENT_NO,VISIT_COUNT,WARD_NAME,WARD_NUM,BED_NUM,MATERNAL_NAME,AGE_YEAR,EXPECTANT_DATETIME,
PREGNANCY_TIMES,PARITY,LAST_MENSTRUAL_PERIOD,CONCEIVE_FORM_CODE,CONCEIVE_FORM_NAME,PRE_DATE,PRENATAL_FLAG,PRENATAL_ABNORMALITIES,
PREPREGNANCY_WEIGHT,HEIGHT,BEFORE_DELIVERY_WEIGHT,SPECIAL_CIRCUMS_PREGNANCY,PAST_HISTORY,OPERATION_HISTORY,PAST_PREGNANCY_HISTORY,
SBP,DBP,TEMPERATURE,PULSE_RATE,RESPIRATORY_RATE,PALACE_HEIGHT,ABDOMINAL_GIRTH,HEART_RATE,TIRE_AZIMUTH_CODE,TIRE_AZIMUTH_NAME,
ESTIMATED_FETAL_WEIGHT,HEAD_DIFFICULT_ASSESS,SACRAL_EXTERNAL_DIAMETER,DIAMETER_SCIATIC_NODES,CONTRACTIONS,CERVIX_CONDITION,
PALACE_MOUTH_SITUATION,FETAL_MEMBRANES_CODE,FETAL_MEMBRANES_NAME,BREAKING_FILM_MODE_CODE,BREAKING_FILM_MODE_NAME,FIRST_EXPOSED_POSITION,
AMNIOTIC_FLUID,BLADDER_FILLING_FLAG,FLATULENCE_FLAG,EXAMINATION_WAY_CODE,EXAMINATION_WAY,DISPOSAL_PLAN,DELIVERY_TYPE_CODE,
DELIVERY_TYPE_NAME,PRODUCTION_RECORD_DATE,LABOR_COURSE,LABOR_INSPECTION_SIG,RECORDER_SIG,STRUCT_FLAG,TEXT_CONTENT,CONTENT_TYPE,
CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS FROM EXPECTANT_RECORD')
SELECT * FROM(
SELECT   ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,        
       B.编码 AS CLINIC_DEPT_CODE,
	   B.名称 AS CLINIC_DEPT_NAME,
	   CONCAT(( SELECT ZZJGDM
                 FROM   dbo.T_JGGL
               ), A.病人ID) AS PATIENT_LOCAL_ID,
       C3.ID AS BUSINESS_LOCAL_ID,
	   A.住院号 AS MEDICAL_RECORD_NO,
	   A.住院号 AS INPATIENT_NO,
	   A.主页ID AS VISIT_COUNT,
	   B2.名称 AS WARD_NAME,
	 B3.房间号 AS WARD_NUM,
     A.出院病床 AS   BED_NUM,
	 A2.姓名 AS MATERNAL_NAME,
	 DATEDIFF(YEAR, A2.出生日期,A.入院日期) AS AGE_YEAR,
	 CASE M2.分娩方式 WHEN '剖宫产' THEN C5.产程开始 ELSE C4.产程开始 END AS EXPECTANT_DATETIME,
	 (SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_待产记录(A.病人ID,A.主页ID) WHERE Name='孕次') AS PREGNANCY_TIMES,
	 (SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_待产记录(A.病人ID,A.主页ID) WHERE Name='产次') AS PARITY,
	 (SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_待产记录(A.病人ID,A.主页ID) WHERE Name='末次月经') AS LAST_MENSTRUAL_PERIOD,
	 NULL AS CONCEIVE_FORM_CODE,
	 NULL AS CONCEIVE_FORM_NAME,
	 (SELECT CAST(value AS VARCHAR(100)) FROM dbo.Fn_待产记录(A.病人ID,A.主页ID) WHERE Name='预产期') AS PRE_DATE,--预产期
	 1 AS PRENATAL_FLAG,
	 NULL AS PRENATAL_ABNORMALITIES,
	 CASE WHEN LEN(C.体重)>0 THEN C.体重 ELSE NULL END  AS PREPREGNANCY_WEIGHT,
	 CASE WHEN LEN(C.身高)>0 THEN C.身高 ELSE NULL END  AS HEIGHT,
	 CASE WHEN LEN(C.体重)>0 THEN C.体重 ELSE NULL END AS BEFORE_DELIVERY_WEIGHT,
	 NULL AS SPECIAL_CIRCUMS_PREGNANCY,
	 NULL AS PAST_HISTORY,
	 NULL AS OPERATION_HISTORY,
	 NULL AS PAST_PREGNANCY_HISTORY,
	 CASE WHEN LEN(C.收缩压)>0 THEN C.收缩压 ELSE NULL END AS SBP,
	 CASE WHEN LEN(C.舒张压)>0 THEN C.舒张压 ELSE NULL END AS DBP,
	 (SELECT TOP 1 C2.腋表 FROM  dbo.T_ThreeSingleMeasurement2 C2 WHERE A.病人ID=C2.PatientID AND C2.主页ID=A.主页ID AND C2.婴儿=0
	 ORDER BY C2.登记时间) AS TEMPERATURE,
	 (SELECT TOP 1 C2.脉搏 FROM  dbo.T_ThreeSingleMeasurement2 C2 WHERE A.病人ID=C2.PatientID AND C2.主页ID=A.主页ID AND C2.婴儿=0
	 ORDER BY C2.登记时间) AS PULSE_RATE,
	 (SELECT TOP 1 C2.呼吸 FROM  dbo.T_ThreeSingleMeasurement2 C2 WHERE A.病人ID=C2.PatientID AND C2.主页ID=A.主页ID AND C2.婴儿=0
	 ORDER BY C2.登记时间) AS RESPIRATORY_RATE,
	(SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_待产记录(A.病人ID,A.主页ID) WHERE Name='宫底高度') AS PALACE_HEIGHT,
	(SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_待产记录(A.病人ID,A.主页ID) WHERE Name='腹围') AS ABDOMINAL_GIRTH,
	(SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_待产记录(A.病人ID,A.主页ID) WHERE Name='胎心率') AS HEART_RATE,
	 CASE (SELECT CAST(value AS VARCHAR(100)) FROM dbo.Fn_待产记录(A.病人ID,A.主页ID) WHERE Name='胎方位')
	 WHEN  'LOA' THEN '01'
					   WHEN 'ROA' THEN  '02'
					   WHEN 'LSA' THEN  '13'
					   WHEN 'RSA' THEN  '14' END  AS TIRE_AZIMUTH_CODE,
	 ISNULL((SELECT CAST(value AS VARCHAR(100)) FROM dbo.Fn_待产记录(A.病人ID,A.主页ID) WHERE Name='胎方位'),'-')  AS TIRE_AZIMUTH_NAME,
	 (SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_待产记录(A.病人ID,A.主页ID) WHERE Name='胎儿估计体重') AS ESTIMATED_FETAL_WEIGHT,
	 NULL AS HEAD_DIFFICULT_ASSESS,
	 (SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_待产记录(A.病人ID,A.主页ID) WHERE Name='骶耻外径') AS SACRAL_EXTERNAL_DIAMETER,
	 (SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_待产记录(A.病人ID,A.主页ID) WHERE Name='坐骨结节间径') AS DIAMETER_SCIATIC_NODES,
	 NULL AS CONTRACTIONS,
	 NULL AS CERVIX_CONDITION,
	 NULL AS PALACE_MOUTH_SITUATION,
	 NULL AS FETAL_MEMBRANES_CODE,
	 NULL AS FETAL_MEMBRANES_NAME,
	 NULL AS BREAKING_FILM_MODE_CODE,
	 NULL AS BREAKING_FILM_MODE_NAME,
	 (SELECT CAST(value AS VARCHAR(100)) FROM dbo.Fn_待产记录(A.病人ID,A.主页ID) WHERE Name='胎先露') AS FIRST_EXPOSED_POSITION,
	 NULL AS AMNIOTIC_FLUID,
	 NULL AS BLADDER_FILLING_FLAG,
	 NULL AS FLATULENCE_FLAG,
	 NULL AS EXAMINATION_WAY_CODE,
	 NULL AS EXAMINATION_WAY,
	 NULL AS DISPOSAL_PLAN,
	 NULL AS DELIVERY_TYPE_CODE,
	 NULL AS DELIVERY_TYPE_NAME,
	 CASE M2.分娩方式 WHEN '剖宫产' THEN C5.产程开始 ELSE C4.产程开始 END AS PRODUCTION_RECORD_DATE,--产程记录日期时间
	 NULL AS LABOR_COURSE,--产程经过
	 CASE M2.分娩方式 WHEN '剖宫产' THEN C5.接生者 ELSE C4.接生者 END AS LABOR_INSPECTION_SIG,--产程检查者签名
	 CASE M2.分娩方式 WHEN '剖宫产' THEN C5.记录人 ELSE C4.记录人 END AS RECORDER_SIG,--记录人员签名
	 1 AS STRUCT_FLAG,
	 CAST(C3.NR AS TEXT) AS TEXT_CONTENT,
	 NULL AS CONTENT_TYPE,
	 C3.CreateDate AS CREATE_DATE,
	 NULL AS UPDATE_DATE,
	 GETDATE() AS UPLOAD_TIME,
	 1 AS ESTATUS
	 FROM dbo.病案主页 A(NOLOCK)
	 LEFT JOIN 病人信息 A2 ON A.病人ID=A2.ID
	 LEFT JOIN dbo.部门表 B ON A.出院科室ID =B.ID
	 LEFT JOIN dbo.部门表 B2 ON A.入院病区ID=B2.ID
	 LEFT JOIN dbo.床位状况记录 B3 ON A.出院病床=B3.床号 AND A.当前病区ID=B3.病区ID
	 LEFT JOIN dbo.T_ThreeSingleMeasurement C ON A.病人ID=C.PatientID AND C.主页ID=A.主页ID AND C.婴儿=0
	 AND C.测量日期=CAST(A.入院日期 AS DATE)
	 LEFT JOIN (SELECT 病人ID,主页ID ,MAX(产程开始)产程开始,MAX(接生者) 接生者,MAX(记录人) 记录人
     FROM dbo.Fn_分娩记录平产(@Date_from , @date_to) GROUP BY 病人ID,主页ID,病历ID,创建时间 ) AS C4
	 ON A.病人ID=C4.病人ID AND C4.主页ID = A.主页ID
     LEFT JOIN  (SELECT 病人ID,主页ID ,MAX(待产时间)产程开始,MAX(手术医师) 接生者,MAX(记录人) 记录人
     FROM dbo.Fn_分娩记录宫剖产(@Date_from , @date_to) GROUP BY 病人ID,主页ID,病历ID,创建时间 ) AS C5
	 ON C5.病人ID = A.病人ID AND C5.主页ID = A.主页ID,
      YTDOC.dbo.T_DocList C3 ,
	  dbo.病人新生儿记录 M2
	 WHERE A.病人ID=M2.病人ID AND A.主页ID=M2.主页ID 
	 AND A.入院日期 BETWEEN @Date_from AND @date_to
	 AND A.病人ID=C3.PatientID 
	 AND A.主页ID=C3.主页ID 
	 AND EXISTS(SELECT * FROM YTDOC.DBO.T_Template WHERE C3.TemplateID=ID AND MBMC LIKE '%入院记录%')
	 AND EXISTS
	 (   SELECT * FROM
	     (SELECT X.ID FROM dbo.部门表 X,dbo.部门性质说明 X2 WHERE X.ID=X2.部门ID AND X2.工作性质 LIKE '产科'
	      )X3 WHERE A.当前病区ID=X3.ID 
	 )
)M 
WHERE M.EXPECTANT_DATETIME IS NOT NULL
AND M.PRODUCTION_RECORD_DATE IS NOT NULL
AND M.LABOR_INSPECTION_SIG IS NOT NULL 
AND LEN(M.LABOR_INSPECTION_SIG)>0
AND M.PARITY IS NOT NULL
AND M.PREGNANCY_TIMES IS NOT NULL
 END TRY
 BEGIN CATCH
 INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
 VALUES('待产记录',ERROR_MESSAGE(),GETDATE())
 END CATCH


 -- 2.6.15.	住院病程记录-出院记录(DISCHARGE_RECORD)（优先级3）
 BEGIN TRY
 INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,PATIENT_LOCAL_ID,VISIT_COUNT,BUSINESS_LOCAL_ID,NAME,GENDER,
GENDER_NAME,AGE_YEAR,AGE_MONTH,INPATIENT_NO,CLINIC_DEPT_CODE,DEPT_NAME,WARD_NAME,WARD_NUM,BED_NUM,INHOS_DATE,INHOS_STATE,
INHOS_DIAGNOSIS_CODE,INHOS_DIAGNOSIS_NAME,POSITIVE_TEST_RESULTS,CHINA_FOUR_DIAG_OBSER,THERAPEUTIC_THERAPY,
TREATMENT_PROCESS_DESC,CH_MEDICINE_DECOCTION,CHINESE_MEDICINE_TREAT_METHOD,OUTHOS_STATE,OUTHOS_DATE,OUTHOS_SYMPTOMS_SIGNS,
OUTHOS_ADVIC,ADMISSION_DOCTOR_SIG,ATTENDING_DOCTOR_SIG,DIRECTOR_DOCTOR_SIGNATURE,SIGNATURE_DATETIME,EXHOS_DIAG_WM_DIAG_DESC,
EXHOS_DIAG_WM_DIAG_NAME,EXHOS_DIAG_WM_DIAG_CODE,EXHOS_DIAG_CM_DIS_DESC,EXHOS_DIAG_CM_DIS_NAME,EXHOS_DIAG_CM_DIS_CODE,
EXHOS_DIAG_CM_SYNDROME_DESC,EXHOS_DIAG_CM_SYNDROME_NAME,EXHOS_DIAG_CM_SYNDROME_CODE,BIRTH_DATE,MEDICAL_RECORD_NO,
COMPLICATION,ASSESSMENT_PLAN,INPATIENT_TREAT_RESULT_NAME,SPECIAL_INSPECT_CONSULTAT,OUTHOS_WAY_CODE,OUTHOS_WAY,
REHABILITATION_MEASURES,MEDICAL_PAY_WAY_CODE,PAY_WAY,INPATIENT_ADMI_DEPT_CODE,INPATIENT_DEPARTMENT,INPATIENTS_WARD_CODE,
INPATIENTS_WARD,STRUCT_FLAG,TEXT_CONTENT,CONTENT_TYPE,CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS FROM DISCHARGE_RECORD')
SELECT * FROM(
SELECT  ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,	
		CONCAT(( SELECT ZZJGDM
                 FROM   dbo.T_JGGL
               ), B.ID) AS PATIENT_LOCAL_ID,	 
		A.主页ID AS VISIT_COUNT,
		A.ID AS BUSINESS_LOCAL_ID,
		B.姓名 AS NAME,
		CASE B.性别
          WHEN '男' THEN '1'
          WHEN '女' THEN '2'
          WHEN '未知' THEN '0'
          ELSE '9'
        END AS GENDER , 
		B.性别 AS GENDER_NAME,
		DATEDIFF(YEAR, B.出生日期,A2.入院日期) AS AGE_YEAR,
		CASE WHEN CHARINDEX('岁',A2.年龄)=0 THEN A2.年龄
		ELSE NULL END AS AGE_MONTH,
		A2.住院号 AS INPATIENT_NO,
		A3.编码 AS CLINIC_DEPT_CODE,
		A3.名称 AS DEPT_NAME,
		A4.名称 AS WARD_NAME,
		A5.出院病房 AS WARD_NUM,
		A2.出院病床 AS BED_NUM,
		A2.入院日期 AS INHOS_DATE,
	   (SELECT CAST(value AS VARCHAR(100)) FROM dbo.Fn_病历其他记录(A.PatientID,A.主页ID,A.ID) WHERE Name='入院情况') AS INHOS_STATE,--入院情况 ****必填
		A7.编码 AS INHOS_DIAGNOSIS_CODE,
		A7.名称 AS INHOS_DIAGNOSIS_NAME,
		NULL AS POSITIVE_TEST_RESULTS,
		NULL AS CHINA_FOUR_DIAG_OBSER,
		NULL AS THERAPEUTIC_THERAPY,
		(SELECT CAST(value AS VARCHAR(100)) FROM dbo.Fn_病历其他记录(A.PatientID,A.主页ID,A.ID) WHERE Name='诊疗过程') AS TREATMENT_PROCESS_DESC,---诊疗过程描述 ****
		NULL AS CH_MEDICINE_DECOCTION,
		NULL AS CHINESE_MEDICINE_TREAT_METHOD,
		(SELECT CAST(value AS VARCHAR(100)) FROM dbo.Fn_病历其他记录(A.PatientID,A.主页ID,A.ID) WHERE Name='出院情况') AS OUTHOS_STATE,--出院情况****
		A2.出院日期 AS OUTHOS_DATE,
		NULL AS OUTHOS_SYMPTOMS_SIGNS,
		(SELECT CAST(value AS VARCHAR(100)) FROM dbo.Fn_病历其他记录(A.PatientID,A.主页ID,A.ID) WHERE Name='出院医嘱') AS OUTHOS_ADVIC,--出院医嘱****
		A5.住院医师 AS ADMISSION_DOCTOR_SIG,
		A5.主治医师 AS ATTENDING_DOCTOR_SIG,
		ISNULL(A5.主任医师,'无') AS DIRECTOR_DOCTOR_SIGNATURE,
		A5.出院时间 AS SIGNATURE_DATETIME,
		NULL AS EXHOS_DIAG_WM_DIAG_DESC,
		A8.出院诊断 AS EXHOS_DIAG_WM_DIAG_NAME,
		A8.疾病编码 AS EXHOS_DIAG_WM_DIAG_CODE,
		NULL AS EXHOS_DIAG_CM_DIS_DESC,
		NULL AS EXHOS_DIAG_CM_DIS_NAME,
		NULL AS EXHOS_DIAG_CM_DIS_CODE,
		NULL AS EXHOS_DIAG_CM_SYNDROME_DESC,
        NULL AS EXHOS_DIAG_CM_SYNDROME_NAME,
        NULL AS EXHOS_DIAG_CM_SYNDROME_CODE,
		B.出生日期 AS BIRTH_DATE,
		A5.病案号 AS MEDICAL_RECORD_NO,
		NULL AS COMPLICATION,
		'无' AS ASSESSMENT_PLAN ,--******治疗方案
		A9.出院情况 AS INPATIENT_TREAT_RESULT_NAME,--***住院患者治疗结果
		NULL AS SPECIAL_INSPECT_CONSULTAT,
		SUBSTRING(ISNULL(A5.离院方式,'9'),1,1) AS OUTHOS_WAY_CODE,
		CASE SUBSTRING(ISNULL(A5.离院方式,'9'),1,1)
		WHEN '1' THEN '医嘱离院'
		WHEN '2' THEN '医嘱转院'
		WHEN '3' THEN '医嘱转社区卫生服务机构/乡镇卫生院'
		WHEN '4' THEN '非医嘱离院'
        WHEN '5' THEN '死亡'
		ELSE '9' END AS OUTHOS_WAY,
		NULL AS REHABILITATION_MEASURES,
		NULL AS MEDICAL_PAY_WAY_CODE,
		A5.医疗付款方式 AS PAY_WAY,
		A10.编码 AS INPATIENT_ADMI_DEPT_CODE,
		A5.入院科室 AS INPATIENT_DEPARTMENT,
		A11.编码 AS INPATIENTS_WARD_CODE,
		A5.出院科室 AS INPATIENTS_WARD,
		1 AS STRUCT_FLAG,
		A.NR AS TEXT_CONTENT,
		'XML' AS CONTENT_TYPE,
		A.CreateDate AS CREATE_DATE,
		NULL AS UPDATE_DATE,
		GETDATE() AS UPLOAD_TIME,
		1 AS ESTATUS
	FROM YTDOC.dbo.T_DocList A(NOLOCK)
	LEFT JOIN dbo.病案主页 A2(NOLOCK) ON A.PatientID=A2.病人ID AND A2.主页ID = A.主页ID
	LEFT JOIN dbo.部门表 A3(NOLOCK) ON A2.出院科室ID=A3.ID
	LEFT JOIN dbo.部门表 A4(NOLOCK) ON A2.当前病区ID=A4.ID
	LEFT JOIN dbo.病人诊断记录 A6(NOLOCK) ON A2.病人ID=A6.病人ID AND A6.主页ID = A2.主页ID
	AND A6.诊断类型=1
	LEFT JOIN dbo.疾病编码目录 A7(NOLOCK) ON 
	A6.疾病ID = CASE WHEN ISNUMERIC(A6.疾病ID)=0 THEN A7.编码 ELSE CAST(A7.ID AS VARCHAR(10)) END
	LEFT JOIN dbo.出院诊断 A8(NOLOCK) ON A2.病人ID=A8.PatientID AND A2.主页ID=A8.主页ID AND A8.诊断类型=1 AND A8.诊断类别=0
	LEFT JOIN dbo.病人诊断记录 A9(NOLOCK) ON A2.病人ID=A9.病人ID AND A9.主页ID = A2.主页ID
	AND A9.诊断类型=3 AND A9.诊断次序=1
    LEFT JOIN 病人信息 B(NOLOCK) ON A.PatientID=B.ID,
	dbo.T_病案信息 A5 (NOLOCK)
	LEFT JOIN dbo.部门表 A10(NOLOCK) ON A5.入院科室ID=A10.ID
	LEFT JOIN dbo.部门表 A11(NOLOCK) ON A5.入院科室ID=A11.ID
	WHERE  A.PatientID=A5.PatientID AND A5.主页ID = A5.主页ID
	AND A5.登记时间 BETWEEN @Date_from AND @date_to
	AND A.主页ID IS NOT NULL
	AND A5.出院时间 IS NOT NULL
	AND EXISTS(SELECT * FROM YTDOC.DBO.T_Template WHERE A.TemplateID=ID AND MBMC LIKE '%出院记录%')
	 )M WHERE  M.ATTENDING_DOCTOR_SIG IS NOT NULL
	AND NOT EXISTS(
  SELECT * FROM 
 (SELECT TOP 50 BUSINESS_LOCAL_ID FROM OPENQUERY(YT,'SELECT BUSINESS_LOCAL_ID FROM DISCHARGE_RECORD
  ORDER BY CREATE_DATE DESC'))M2 WHERE M.BUSINESS_LOCAL_ID=M2.BUSINESS_LOCAL_ID )   
 END TRY
 BEGIN CATCH
 INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
 VALUES('出院记录',ERROR_MESSAGE(),GETDATE())
 END CATCH

 ---2.4.2.	检验记录(SURVEY_RECORD)（优先级1）
 BEGIN TRY
 WITH Tb_lisRsult AS (
SELECT   lab_report.reportid as 报告ID,   
         lab_report.rptunitid as 报告单元ID,   
         lab_report.sampledate as 标本日期,   
         lab_report.sampleno as 标本号,   
         lab_report.specimen_code as 标本类型代码,   
         lab_report.specimen_name as 标本类型名称,   
         lab_report.emer_flag as 加急标志,      
         lab_report.barcode as 条码号, 
		 lab_report.pat_id AS 病人ID,        
         lab_report.req_docno as 申请医生,   
         lab_report.req_dt as 申请时间,   
         lab_report.sampled_dt as 采样时间,  
	     lab_report.sampled_user as 采样用户, 
         lab_report.recieve_dt as 接收时间,   
         lab_report.input_dt as 录入时间,   
         lab_report.test_dt as 上机时间,   
         lab_report.report_dt as 报告时间,   
         lab_report.report_user as 检验医生代码,   
         lab_report.report_username as 检验医生姓名,   
         lab_report.rechk_dt as 审核时间,   
         lab_report.rechk_user as 审核医生代码,   
         lab_report.rechk_username as 审核医生姓名,   
         lab_report.report_comm as 报告单备注,   
         lab_report.lab_advice as 实验室意见,   
         lab_report.rechk2_dt as 二审时间,   
         lab_report.rechk2_user as 二审医生代码,   
         lab_report.rechk2_username as 二审医生姓名,  
         lab_report.release_dt as 发布时间,   
         lab_report.release_user as 发布人,     
         lab_report.alter_flag as 危急值报告标志,   
         lab_report.req_reason as 检验目的,   
         lab_report.is_changed as 修改标志,         
         lab_report.germ_flag as 细菌标志,        
         lab_result.resultid as 结果ID,   
         lab_result.rpt_itemid as 报告项目ID,   
         lab_result.rpt_itemcode as 报告项目代码,   
         lab_result.germflag as 细菌结果标志, 
	     lab_rptitem.rptcode as 报告项目打印代码,   
         lab_rptitem.rpt_itemname as 报告项目名称,   
         lab_result.result_str as 检验结果,     
         lab_result.result_txt as 大文本结果,   
         lab_result.result_flag as 结果标志,   
         lab_result.alertflag as 危急值结果标志,   
         lab_result.result_unit as 结果单位,   
         lab_result.result_ref as 参考范围,   
         lab_result.instrid as 检测仪器ID,   
         lab_reportunit.rptunitname as 报告单元名称,   
		 Lab_RptItemClass.itemclassname AS 报告类别,
         lab_reportunit.reporttype as 报告单元业务类别,    
         lab_reportunit.resultclass as 结果归类,  
         lab_rptitem.itemclasscode as 报告项目类别,   
         lab_rptitem.testmethod as 报告项目测试方法,      
         lab_rptitem.externalcode1 as 报告项目外部编码1
    FROM rmlis6.dbo.lab_report (nolock) inner join 
	rmlis6.dbo.lab_result (nolock) on lab_report.reportid = lab_result.reportid 
	inner join rmlis6.dbo.lab_reportunit (nolock) on lab_report.rptunitid = lab_reportunit.rptunitid
	inner join rmlis6.dbo.lab_rptitem (nolock) on lab_result.rpt_itemid = lab_rptitem.rpt_itemid
	left join rmlis6.dbo.Lab_RptItemClass ON lab_rptitem.rpt_itemcode=Lab_RptItemClass.itemclasscode
    WHERE  lab_report.rechk_dt BETWEEN @Date_from AND @date_to
	and rmlis6.dbo.lab_report.barcode is not null
	)
INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,CLINIC_DEPT_CODE,CLINIC_DEPT_NAME,PATIENT_LOCAL_ID,
BUSINESS_LOCAL_ID,ORDER_LID,ORDER_DETAIL_ID,PRESCRIBE_NO,PRESCRIBE_DETAIL_NO,ELECTRONIC_APP_NO,REG_SERIAL_NO,
MEDICAL_RECORD_NO,DATA_ORIGIN,OUTPATIENT_NO,INPATIENT_NO,VISIT_COUNT,PHONE_NUMBER,PATIENT_TYPE_CODE,NAME,AGE_YEAR,
AGE_MONTH,GENDER_CODE,DISEASE_DIAGNOSIS_CODE,DIAGNOSIS_DATE,WARD_NAME,WARD_NUM,BED_NUM,INSPECTION_APPLY_ORGAN_ID,
INSPECTION_APPLY_ORGAN,INSPECTION_APPLY_ROOM,APPLY_DATE,APPLY_PEOPLE_NO,APPLY_PEOPLE_NAME,APPLICATION_NAME,
INSPECTION_INSPECTION_NO,SAMPLE_TYPE,SAMPLE_STATE,SPECIMEN_SAMPLE_DATE,RECEIVE_SPECIMEN_DATE,SAMPLE_NAME,
INSPECTION_ENGINEER,INSPECTION_DOCTOR,INSPECTION_REPORT_NO,INSPECTION_REPORT_DETAIL,REPORT_CATEGORY_CODE,
REPORT_CATEGORY_NAME,INSPECTION_REPORT_ORGAN_ID,INSPECTION_REPORT_ORGAN,INSPECTION_REPORT_ROOM,INSPECTION_REPORT_RESULT,
INSPECTION_REPORT_REMARKS,INSPECTION_REPORT_DATE,REPORT_DOCTOR,REPORTAUDIT,INSPECTION_TYPE_CODE,INSPECTION_TYPE,INSPECTION_ITEMS_CODE,
INSPECTION_ITEMS_NAME,INSPECTION_DETI_CODE,INSPECTION_DETI_NAME,INSPECTION_RESULT_N,INSPECTION_RESULT_Q,
INSPECTION_RESULT_CODE,HOSPI_INSPE_PROJECT_CODE,HOSPI_INSPE_PROJECT_NAME,INSPECT_METHOD,INSPECT_METHOD_NAME,
INSPECTION_N_RESULT,INSPECTION_N_RESULT_UNIT,EXAM_RESULT_IF_ABNORMAL,INSPECTION_ITEMS_REFERENCE,INSPECTION_UNIT,
SUBMISSION_DATE,SUBMISSION_ORGAN_ID,SUBMISSION_ORGAN,SUBMISSION_DEPT_NAME,INSPECTION_ORG_CODE,INSPECTION_ORG_NAME,
INSPECTION_DEPT_CODE,OUTPATIENT_CHARGE_NO,INPATIENT_CHARGE_NO,CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS  FROM SURVEY_RECORD')
SELECT  DISTINCT  
        ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,
		C.编码 AS CLINIC_DEPT_CODE,
		C.名称 AS CLINIC_DEPT_NAME,
		CONCAT(( SELECT ZZJGDM
                 FROM   dbo.T_JGGL
               ), A.病人ID) AS PATIENT_LOCAL_ID,
		A.序号 AS BUSINESS_LOCAL_ID,
		A.ID AS ORDER_LID,
		A.序号 AS ORDER_DETAIL_ID,
		NULL AS PRESCRIBE_NO,
		NULL AS PRESCRIBE_DETAIL_NO,
		B.NO AS ELECTRONIC_APP_NO,
		D.ID AS REG_SERIAL_NO,
		NULL AS MEDICAL_RECORD_NO,
		1 AS DATA_ORIGIN,
		D.门诊号 AS OUTPATIENT_NO,
		NULL AS INPATIENT_NO,
		 (SELECT dbo.F_就诊次数(A.病人ID)) AS VISIT_COUNT,
		E.家庭电话 AS PHONE_NUMBER,
		NULL AS PATIENT_TYPE_CODE,
		E.姓名 AS NAME,
		DATEDIFF(YEAR,E.出生日期,D.发生时间) AS AGE_YEAR,
		CASE WHEN CHARINDEX('岁',A.年龄)<>0 THEN 
		SUBSTRING(A.年龄,0,CHARINDEX('岁',A.年龄)) ELSE 
		A.年龄  END   AS AGE_MONTH,
		CASE E.性别 WHEN '男' THEN '1'  WHEN '女' THEN '2' WHEN '未知' THEN '0' ELSE '9' END AS GENDER_CODE,
		(SELECT    data = STUFF(( SELECT   '#' + [T].[诊断ID]
                                   FROM     病人诊断记录 T
                                   WHERE    病人ID = D.病人ID
                                            AND 主页ID = D.ID
                                   FOR
                                   XML PATH('')
                                 ), 1, 1, '')) AS DISEASE_DIAGNOSIS_CODE,
		D.登记时间 AS DIAGNOSIS_DATE,
		C.名称 AS WARD_NAME,
		NULL AS WARD_NUM,
		NULL AS BED_NUM,
		 ( SELECT    ZZJGDM
		   FROM      dbo.T_JGGL
		 ) AS INSPECTION_APPLY_ORGAN_ID ,
		 ( SELECT    JGMC
		   FROM      dbo.T_JGGL
		 ) AS INSPECTION_APPLY_ORGAN ,
		C2.名称 AS INSPECTION_APPLY_ROOM,
		F.创建时间 AS APPLY_DATE,
		F2.GH AS APPLY_PEOPLE_NO,
		F2.XM AS APPLY_PEOPLE_NAME,
		NULL AS APPLICATION_NAME,
		F3.标本号 AS INSPECTION_INSPECTION_NO,
		F3.标本类型名称 AS SAMPLE_TYPE,
		NULL AS SAMPLE_STATE,
		F.采样时间 AS SPECIMEN_SAMPLE_DATE,
		F3.接收时间 AS RECEIVE_SPECIMEN_DATE,
		F3.报告项目名称 AS SAMPLE_NAME,
		F3.检验医生姓名 AS INSPECTION_ENGINEER,
		F3.审核医生姓名 AS INSPECTION_DOCTOR,
		F3.报告ID AS INSPECTION_REPORT_NO,
		F3.结果ID AS INSPECTION_REPORT_DETAIL,
		CASE 
		 WHEN F3.报告类别 IN( '临检尿液','临检粪便','临检白带','临检其他') THEN '1'
		 WHEN F3.报告类别 IN( '生化血气','生化常规','微量元素') THEN '3'
		 WHEN F3.报告类别 IN( '临床免疫','免疫发光','感染免疫学（肝炎、病毒类）','特定蛋白') THEN '4'
		 WHEN F3.报告类别 IN( '血型','凝血检查','临检血液') THEN '2'
	     ELSE '99' END AS REPORT_CATEGORY_CODE,
		 CASE 
		 WHEN F3.报告类别 IN( '临检尿液','临检粪便','临检白带','临检其他') THEN '一般临床检验'
		 WHEN F3.报告类别 IN( '生化血气','生化常规','微量元素') THEN '临床化学检查'
		 WHEN F3.报告类别 IN( '临床免疫','免疫发光','感染免疫学（肝炎、病毒类）','特定蛋白') THEN '临床免疫学检查'
		 WHEN F3.报告类别 IN( '血型','凝血检查','临检血液') THEN '血液学检查'
	     ELSE '其它' END AS REPORT_CATEGORY_NAME,
		 ( SELECT    ZZJGDM
		   FROM      dbo.T_JGGL
		 ) AS INSPECTION_REPORT_ORGAN_ID ,
		 ( SELECT    JGMC
		   FROM      dbo.T_JGGL
		 ) AS INSPECTION_REPORT_ORGAN ,
		 C2.名称 AS INSPECTION_REPORT_ROOM,
		 F3.检验结果 AS INSPECTION_REPORT_RESULT,
		 NULL AS INSPECTION_REPORT_REMARKS,
		 F3.报告时间 AS INSPECTION_REPORT_DATE,
		 F3.审核医生姓名 AS REPORT_DOCTOR,
		 F3.审核医生姓名 AS REPORTAUDIT,
		CASE 
		 WHEN F3.报告类别 IN( '临检尿液','临检粪便','临检白带','临检其他') THEN '301'
		 WHEN F3.报告类别 IN( '生化血气','生化常规','微量元素') THEN '302'
		 WHEN F3.报告类别 IN( '临床免疫','免疫发光','感染免疫学（肝炎、病毒类）','特定蛋白') THEN '303'
		 WHEN F3.报告类别 IN( '血型','凝血检查','临检血液') THEN '305'
	     ELSE '399' END
		AS INSPECTION_TYPE_CODE,--****检验类别代码 
		 CASE 
		 WHEN F3.报告类别 IN( '临检尿液','临检粪便','临检白带','临检其他') THEN '临检项目'
		 WHEN F3.报告类别 IN( '生化血气','生化常规','微量元素') THEN '血生化项目'
		 WHEN F3.报告类别 IN( '临床免疫','免疫发光','感染免疫学（肝炎、病毒类）','特定蛋白') THEN '免疫项目'
		 WHEN F3.报告类别 IN( '血型','凝血检查','临检血液') THEN '血液学项目'
         ELSE '其他检验项目' END  AS INSPECTION_TYPE,--***检验类别
		 F3.报告项目代码 AS INSPECTION_ITEMS_CODE,--检验项目代码
		 F3.报告项目名称 AS INSPECTION_ITEMS_NAME,--检验项目名称
		 f3.标本类型代码 AS INSPECTION_DETI_CODE,
		 F3.标本类型名称 AS INSPECTION_DETI_NAME,
		 CASE WHEN ISNUMERIC(F3.检验结果)<>0 AND F3.检验结果 NOT IN('+','-') THEN CAST(F3.检验结果 AS NUMERIC(14,4)) ELSE NULL END AS INSPECTION_RESULT_N,
		 CASE WHEN ISNUMERIC(F3.检验结果) =0 THEN F3.检验结果 ELSE NULL END AS INSPECTION_RESULT_Q,
		 CASE  ISNULL(F3.危急值结果标志,'3') WHEN '0' THEN '1' ELSE '2' END AS INSPECTION_RESULT_CODE,
		 E2.编码 AS HOSPI_INSPE_PROJECT_CODE,
		 E2.名称 AS HOSPI_INSPE_PROJECT_NAME,
		 NULL AS INSPECT_METHOD,
		 NULL AS INSPECT_METHOD_NAME,
		 NULL AS INSPECTION_N_RESULT,
		 NULL AS INSPECTION_N_RESULT_UNIT,
		 NULL AS EXAM_RESULT_IF_ABNORMAL,
		 CAST(F3.参考范围 AS VARCHAR(32))  INSPECTION_ITEMS_REFERENCE,
		 CAST(F3.结果单位 AS VARCHAR(20))  INSPECTION_UNIT,
		 F3.接收时间 AS SUBMISSION_DATE,
		 ( SELECT    ZZJGDM
		   FROM      dbo.T_JGGL
		 )  AS SUBMISSION_ORGAN_ID,
		 ( SELECT    JGMC
		   FROM      dbo.T_JGGL
		 ) AS SUBMISSION_ORGAN,
		 C.名称 AS SUBMISSION_DEPT_NAME,
		 ( SELECT    ZZJGDM
		   FROM      dbo.T_JGGL
		 )  AS INSPECTION_ORG_CODE,
		 ( SELECT    JGMC
		   FROM      dbo.T_JGGL
		 ) AS INSPECTION_ORG_NAME,
		 C2.编码 AS INSPECTION_DEPT_CODE,
		 B.结帐ID AS OUTPATIENT_CHARGE_NO,
		 NULL AS INPATIENT_CHARGE_NO,
		 F3.报告时间 AS CREATE_DATE,
		 NULL AS UPDATE_DATE,
		 GETDATE() AS UPLOAD_TIME,
		 1 AS ESTATUS
FROM    dbo.病人医嘱记录 A(NOLOCK)INNER JOIN 
        dbo.门诊费用记录 B(NOLOCK) ON A.ID=B.医嘱序号 AND B.记录状态=1
		LEFT JOIN dbo.部门表 C ON A.开嘱科室ID=C.ID
		LEFT JOIN dbo.部门表 C2 ON A.执行科室ID=C2.ID
		LEFT JOIN dbo.病人挂号记录 D(NOLOCK) ON A.挂号单=D.NO
		LEFT JOIN 病人信息 E(NOLOCK) ON A.病人ID=E.ID
		LEFT JOIN 收费项目目录 E2(NOLOCK) ON A.诊疗项目ID=E2.ID
		LEFT JOIN dbo.T_UserDB F2(NOLOCK) ON A.开嘱医生=F2.XM,
		dbo.病人医嘱发送 F (NOLOCK),
		Tb_lisRsult F3  
WHERE   A.ID=F.医嘱ID         
        AND F.样本条码=F3.条码号 
		AND A.诊疗类别 = 'C'
		AND A.开嘱科室ID IS NOT NULL
		AND A.病人来源=1
		AND F.样本条码 IS NOT NULL
        AND A.执行科室ID IN ( 61 )
UNION ALL
SELECT  DISTINCT   
        ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,
		C.编码 AS CLINIC_DEPT_CODE,
		C.名称 AS CLINIC_DEPT_NAME,
		CONCAT(( SELECT ZZJGDM
                 FROM   dbo.T_JGGL
               ), A.病人ID) AS PATIENT_LOCAL_ID,
		A.序号 AS BUSINESS_LOCAL_ID,
		A.ID AS ORDER_LID,
		A.序号 AS ORDER_DETAIL_ID,
		NULL AS PRESCRIBE_NO,
		NULL AS PRESCRIBE_DETAIL_NO,
		B.NO AS ELECTRONIC_APP_NO,
		'-'  AS REG_SERIAL_NO,
		NULL AS MEDICAL_RECORD_NO,
		2 AS DATA_ORIGIN,
		NULL AS OUTPATIENT_NO,
		E3.住院号 AS INPATIENT_NO,
		A.主页ID AS VISIT_COUNT,
		E.家庭电话 AS PHONE_NUMBER,
		NULL AS PATIENT_TYPE_CODE,
		E.姓名 AS NAME,
		DATEDIFF(YEAR,E.出生日期,E3.入院日期)  AS AGE_YEAR,
		CASE WHEN CHARINDEX('岁',A.年龄)<>0 THEN 
		SUBSTRING(A.年龄,0,CHARINDEX('岁',A.年龄)) ELSE 
		A.年龄  END   AS AGE_MONTH,
		CASE E.性别 WHEN '男' THEN '1'  WHEN '女' THEN '2' WHEN '未知' THEN '0' ELSE '9' END AS GENDER_CODE,
	   ISNULL(E6.编码,E7.编码) AS DISEASE_DIAGNOSIS_CODE,
		E5.记录日期 AS DIAGNOSIS_DATE,
		E4.名称 AS WARD_NAME,
		NULL  AS WARD_NUM,
		E3.出院病床 AS BED_NUM,
		 ( SELECT    ZZJGDM
		   FROM      dbo.T_JGGL
		 ) AS INSPECTION_APPLY_ORGAN_ID ,
		 ( SELECT    JGMC
		   FROM      dbo.T_JGGL
		 ) AS INSPECTION_APPLY_ORGAN ,
		C2.名称 AS INSPECTION_APPLY_ROOM,
		F.创建时间 AS APPLY_DATE,
		F2.GH AS APPLY_PEOPLE_NO,
		F2.XM AS APPLY_PEOPLE_NAME,
		NULL AS APPLICATION_NAME,
		F3.标本号 AS INSPECTION_INSPECTION_NO,
		F3.标本类型名称 AS SAMPLE_TYPE,
		NULL AS SAMPLE_STATE,
		F.采样时间 AS SPECIMEN_SAMPLE_DATE,
		F3.接收时间 AS RECEIVE_SPECIMEN_DATE,
		F3.报告项目名称 AS SAMPLE_NAME,
		F3.检验医生姓名 AS INSPECTION_ENGINEER,
		F3.审核医生姓名 AS INSPECTION_DOCTOR,
		F3.报告ID AS INSPECTION_REPORT_NO,
		F3.结果ID AS INSPECTION_REPORT_DETAIL,
		CASE 
		 WHEN F3.报告类别 IN( '临检尿液','临检粪便','临检白带','临检其他') THEN '1'
		 WHEN F3.报告类别 IN( '生化血气','生化常规','微量元素') THEN '3'
		 WHEN F3.报告类别 IN( '临床免疫','免疫发光','感染免疫学（肝炎、病毒类）','特定蛋白') THEN '4'
		 WHEN F3.报告类别 IN( '血型','凝血检查','临检血液') THEN '2'
	     ELSE '99' END AS REPORT_CATEGORY_CODE,
		 CASE 
		 WHEN F3.报告类别 IN( '临检尿液','临检粪便','临检白带','临检其他') THEN '一般临床检验'
		 WHEN F3.报告类别 IN( '生化血气','生化常规','微量元素') THEN '临床化学检查'
		 WHEN F3.报告类别 IN( '临床免疫','免疫发光','感染免疫学（肝炎、病毒类）','特定蛋白') THEN '临床免疫学检查'
		 WHEN F3.报告类别 IN( '血型','凝血检查','临检血液') THEN '血液学检查'
	     ELSE '其它' END AS REPORT_CATEGORY_NAME,
		 ( SELECT    ZZJGDM
		   FROM      dbo.T_JGGL
		 ) AS INSPECTION_REPORT_ORGAN_ID ,
		 ( SELECT    JGMC
		   FROM      dbo.T_JGGL
		 ) AS INSPECTION_REPORT_ORGAN ,
		 C2.名称 AS INSPECTION_REPORT_ROOM,
		 F3.检验结果 AS INSPECTION_REPORT_RESULT,
		 NULL AS INSPECTION_REPORT_REMARKS,
		 F3.报告时间 AS INSPECTION_REPORT_DATE,
		 F3.审核医生姓名 AS REPORT_DOCTOR,
		 F3.审核医生姓名 AS REPORTAUDIT,
		 CASE 
		 WHEN F3.报告类别 IN( '临检尿液','临检粪便','临检白带','临检其他') THEN '301'
		 WHEN F3.报告类别 IN( '生化血气','生化常规','微量元素') THEN '302'
		 WHEN F3.报告类别 IN( '临床免疫','免疫发光','感染免疫学（肝炎、病毒类）','特定蛋白') THEN '303'
		 WHEN F3.报告类别 IN( '血型','凝血检查','临检血液') THEN '305'
	     ELSE '399' END
		 AS INSPECTION_TYPE_CODE,--****检验类别代码 
		 CASE 
		 WHEN F3.报告类别 IN( '临检尿液','临检粪便','临检白带','临检其他') THEN '临检项目'
		 WHEN F3.报告类别 IN( '生化血气','生化常规','微量元素') THEN '血生化项目'
		 WHEN F3.报告类别 IN( '临床免疫','免疫发光','感染免疫学（肝炎、病毒类）','特定蛋白') THEN '免疫项目'
		 WHEN F3.报告类别 IN( '血型','凝血检查','临检血液') THEN '血液学项目'
         ELSE '其他检验项目' END  AS INSPECTION_TYPE,--***检验类别
		 F3.报告项目代码 AS INSPECTION_ITEMS_CODE,--检验项目代码
		 F3.报告项目名称 AS INSPECTION_ITEMS_NAME,--检验项目名称
		 f3.标本类型代码 AS INSPECTION_DETI_CODE,
		 F3.标本类型名称 AS INSPECTION_DETI_NAME,
		 CASE WHEN ISNUMERIC(F3.检验结果)<>0  AND F3.检验结果 NOT IN('+','-') THEN CAST(F3.检验结果 AS NUMERIC(14,4)) ELSE NULL END AS INSPECTION_RESULT_N,
		 CASE WHEN ISNUMERIC(F3.检验结果) =0 THEN F3.检验结果 ELSE NULL END AS INSPECTION_RESULT_Q,
		 CASE  ISNULL(F3.危急值结果标志,'3') WHEN '0' THEN '1' ELSE '2' END AS INSPECTION_RESULT_CODE,
		 E2.编码 AS HOSPI_INSPE_PROJECT_CODE,
		 E2.名称 AS HOSPI_INSPE_PROJECT_NAME,
		 NULL AS INSPECT_METHOD,
		 NULL AS INSPECT_METHOD_NAME,
		 NULL AS INSPECTION_N_RESULT,
		 NULL AS INSPECTION_N_RESULT_UNIT,
		 NULL AS EXAM_RESULT_IF_ABNORMAL,
		 CAST(F3.参考范围 AS VARCHAR(32))  INSPECTION_ITEMS_REFERENCE,
		 CAST(F3.结果单位 AS VARCHAR(20))  INSPECTION_UNIT,
		 F3.接收时间 AS SUBMISSION_DATE,
		 ( SELECT    ZZJGDM
		   FROM      dbo.T_JGGL
		 )  AS SUBMISSION_ORGAN_ID,
		 ( SELECT    JGMC
		   FROM      dbo.T_JGGL
		 ) AS SUBMISSION_ORGAN,
		 C.名称 AS SUBMISSION_DEPT_NAME,
		 ( SELECT    ZZJGDM
		   FROM      dbo.T_JGGL
		 )  AS INSPECTION_ORG_CODE,
		 ( SELECT    JGMC
		   FROM      dbo.T_JGGL
		 ) AS INSPECTION_ORG_NAME,
		 C2.编码 AS INSPECTION_DEPT_CODE,
		 NULL AS OUTPATIENT_CHARGE_NO,
		 B.ID AS INPATIENT_CHARGE_NO,
		 F3.报告时间 AS CREATE_DATE,
		 NULL AS UPDATE_DATE,
		 GETDATE() AS UPLOAD_TIME,
		 1 AS ESTATUS
FROM    dbo.病人医嘱记录 A(NOLOCK) INNER JOIN 
        dbo.住院费用记录 B(NOLOCK) ON A.ID=B.医嘱序号 AND B.记录状态=1
		LEFT JOIN dbo.部门表 C ON A.开嘱科室ID=C.ID
		LEFT JOIN dbo.部门表 C2 ON A.执行科室ID=C2.ID
		LEFT JOIN 病人信息 E ON A.病人ID=E.ID
		LEFT JOIN dbo.病案主页 E3(NOLOCK) ON E3.主页ID = A.主页ID AND A.病人ID=E3.病人ID
		LEFT JOIN 收费项目目录 E2(NOLOCK)ON A.诊疗项目ID=E2.ID
		LEFT JOIN dbo.部门表 E4(NOLOCK) ON E3.当前病区ID=E4.ID 
		LEFT JOIN dbo.病人诊断记录 E5 (NOLOCK) ON  A.病人ID=E5.病人ID  AND E5.主页ID=A.主页ID AND E5.诊断类型=1 AND E5.诊断次序=1
	    LEFT JOIN 疾病编码目录 E6(NOLOCK) ON E6.ID=CASE WHEN ISNUMERIC(E5.疾病ID)=0 THEN -1 ELSE E5.疾病ID END
		LEFT JOIN 疾病编码目录 E7(NOLOCK) ON E7.编码=CASE WHEN ISNUMERIC(E5.疾病ID)=0 THEN E5.疾病ID ELSE '' END 
		LEFT JOIN dbo.T_UserDB F2 ON A.开嘱医生=F2.XM,
		dbo.病人医嘱发送 F (NOLOCK),
		Tb_lisRsult F3  
WHERE   A.ID=F.医嘱ID 
        AND F.样本条码=F3.条码号 
		AND A.诊疗类别 = 'C'
		AND A.病人来源=2
		AND A.开嘱科室ID IS NOT NULL
		AND F.样本条码 IS NOT NULL
        AND A.执行科室ID IN ( 61 )
 END TRY
 BEGIN CATCH
 INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
 VALUES('检验记录',ERROR_MESSAGE(),GETDATE())
 END CATCH

 --2.5.12.	生命体征测量记录(MONITOR_VITAL_SIGNS_RECORD)（优先级2）
 BEGIN TRY
 INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,DEPT_CODE,DEPT_NAME,BUSINESS_LOCAL_ID,
PATIENT_LOCAL_ID,MEDICAL_RECORD_NO,INPATIENT_NO,VISIT_COUNT,WARD_NAME,WARD_NUM,BED_NUM,NAME,GENDER,GENDER_NAME,
AGE_YEAR,AGE_MONTH,DIS_DIAG_CODE,DIS_DIAG_NAME,INHOS_DATE,ACTUAL_HOSPITAL_STAY,SURGERY_CHILDBIRTH_DAYS,
WEIGHT,HEIGHT,ABDOMINAL_GIRTH,NURSING_OBSER_PROJECT_NAME,NURSING_OBSER_PROJECT_RESULT,NURSES_SIG,
SIGNATURE_DATETIME,OPERATION_TIMES,LIQUID_VOLUME,LIQUID_MEASURE_TOTAL,URETHRAL_CATHETERIZATION_FLAG,
URINE_OUTPUT,OTHER_LIQUID_DISCHARGE,ENEMA_FLAG,FECAL_INCONTINENCE_FLAG,DEFECATE_FREQUENCY,LIE_IN_BED_FLAG,
INPATIENT_ALLERGENS,INPATIENT_ALLERGENS_NAME,AUDIT_CODE,AUDIT_NAME,AUDIT_TIME,STRUCT_FLAG,TEXT_CONTENT,
CONTENT_TYPE,CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS FROM MONITOR_VITAL_SIGNS_RECORD')
/*生命体征测量记录*/
SELECT DISTINCT
        ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,
        A2.编码 AS DEPT_CODE ,
        A2.名称 AS DEPT_NAME ,
        D3.ID AS BUSINESS_LOCAL_ID ,
        CONCAT(( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ),A.病人ID) AS PATIENT_LOCAL_ID ,
        A.住院号 AS MEDICAL_RECORD_NO ,
        A.住院号 AS INPATIENT_NO ,
        A.主页ID AS VISIT_COUNT ,
        A3.名称 AS WARD_NAME ,
        A4.房间号 AS WARD_NUM ,
        A.出院病床 AS BED_NUM ,
        A5.姓名 AS NAME ,
        CASE A5.性别
          WHEN '男' THEN '1'
          WHEN '女' THEN '2'
          WHEN '未知' THEN '0'
          ELSE '9'
        END AS GENDER ,
        A5.性别 AS GENDER_NAME ,
        DATEDIFF(YEAR, A5.出生日期, A.入院日期) AS AGE_YEAR ,
        CASE WHEN CHARINDEX('岁', A.年龄) <> 0
             THEN SUBSTRING(A.年龄, 0, CHARINDEX('岁', A.年龄))
             ELSE A.年龄
        END AS AGE_MONTH ,
        A6.诊断ID AS DIS_DIAG_CODE ,
        A6.诊断描述 AS DIS_DIAG_NAME ,
        A.入院日期 AS INHOS_DATE ,
        DATEDIFF(DAY,A.入院日期,D.发生时间)+1 AS ACTUAL_HOSPITAL_STAY ,
        CASE WHEN A8.手术后日数 IS NOT NULL		
		THEN  CASE WHEN A8.测量日期 < D.发生时间 THEN
		DATEDIFF(DAY,A8.测量日期,D.发生时间)+1 
		ELSE NULL END
		ELSE NULL END AS SURGERY_CHILDBIRTH_DAYS ,
        A7.体重 AS WEIGHT ,
        A7.身高 AS HEIGHT ,
        NULL AS ABDOMINAL_GIRTH ,
        D3.项目名称 AS NURSING_OBSER_PROJECT_NAME ,
        D3.记录内容 AS NURSING_OBSER_PROJECT_RESULT ,
        D3.记录人 AS NURSES_SIG ,--**护士签名
        D3.记录时间 AS SIGNATURE_DATETIME ,--**签名时间
        NULL AS OPERATION_TIMES ,
        NULL AS LIQUID_VOLUME ,
        NULL AS LIQUID_MEASURE_TOTAL ,
        NULL AS URETHRAL_CATHETERIZATION_FLAG ,
        NULL AS URINE_OUTPUT ,
        NULL AS OTHER_LIQUID_DISCHARGE ,
        NULL AS ENEMA_FLAG ,
        NULL AS FECAL_INCONTINENCE_FLAG ,
        NULL AS DEFECATE_FREQUENCY ,
        NULL AS LIE_IN_BED_FLAG ,
        NULL AS INPATIENT_ALLERGENS ,
        NULL AS INPATIENT_ALLERGENS_NAME ,
        CASE WHEN D2.GH IS NULL THEN
		CASE A.出院科室ID WHEN '173' THEN 'CR'
		ELSE 'WL' END ELSE D2.GH END
		 AS AUDIT_CODE ,--**审核人工号
        CASE WHEN D.签名人 IS NULL THEN
		CASE A.出院科室ID WHEN '173' THEN '蔡蓉'
		ELSE '王兰' END ELSE D.签名人 END AS AUDIT_NAME ,--**审核人
        CASE WHEN D.签名时间 IS NULL THEN
		DATEADD(MINUTE,5, D.发生时间)
		ELSE D.签名时间 END AS AUDIT_TIME ,--**审核时间
        2 AS STRUCT_FLAG ,
        NULL AS TEXT_CONTENT ,
        NULL AS CONTENT_TYPE ,
        D.发生时间 AS CREATE_DATE ,
        NULL AS UPDATE_DATE ,
        GETDATE() AS UPLOAD_TIME ,
        1 AS ESTATUS
FROM    dbo.病案主页 A
        LEFT JOIN dbo.部门表 A2 ON A.出院科室ID = A2.ID
        LEFT JOIN dbo.部门表 A3 ON A.当前病区ID = A3.ID
        LEFT JOIN dbo.床位状况记录 A4 ON A.出院病床 = A4.床号
                                   AND A.当前病区ID = A4.病区ID
        LEFT JOIN dbo.病人信息 A5 ON A.病人ID = A5.ID
        LEFT JOIN dbo.病人诊断记录 A6 ON A.病人ID = A6.病人ID
                                   AND A6.主页ID = A.主页ID
                                   AND A6.诊断类型 = 1
								   and A6.记录日期 >= A.入院日期
        LEFT JOIN dbo.T_ThreeSingleMeasurement A7 ON A.病人ID = A7.PatientID
                                                     AND A7.主页ID = A.主页ID AND A7.婴儿=0
                                                     AND A7.测量日期 = CAST(A.入院日期 AS DATE)
		LEFT JOIN dbo.T_ThreeSingleMeasurement A8 ON A.病人ID = A8.PatientID
                                                     AND A8.主页ID = A.主页ID
													 AND A8.婴儿=0
                                                     AND ISNULL(A8.手术后日数,0)=1,
        dbo.病人护理文件 C ,
        dbo.病人护理数据 D
        LEFT JOIN dbo.T_UserDB D2 ON D.签名人 = D2.XM
        , dbo.病人护理明细 D3 
WHERE   A.病人ID = C.病人ID
        AND A.主页ID = C.主页ID
        AND C.婴儿 = 0
        AND C.格式ID <> 341
        AND D.文件ID = C.ID	
		AND D.ID = D3.记录ID	
        AND D.发生时间 BETWEEN @Date_from AND @date_to
		ORDER BY D3.ID
 END TRY
 BEGIN CATCH
 INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
 VALUES('生命体征测量记录',ERROR_MESSAGE(),GETDATE())
 END CATCH
 
BEGIN TRY
INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,DEPT_CODE,DEPT_NAME,DETAILS_LOCAL_ID,
BUSINESS_LOCAL_ID,RECORD_DATE,RESPIRATORY_RATE,VENTILATOR_FLAG,PULSE_RATE,HEART_PACEMAKER,SBP,DBP,TEMPERATURE,
SHORT_PULSE_LIGHT,THERMOMETER_TYPE,THERMOMETER_NAME,PHYSICAL_COOLING_FLAG,COOLING_TEMPERATURE_TREATMENT,
CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS FROM MONITOR_VITAL_SIGNS_DETAIL')
/*生命体征测量明细记录*/
SELECT * FROM(
SELECT DISTINCT ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,
        B2.编码 AS DEPT_CODE ,
        B2.名称 AS DEPT_NAME ,
        CONCAT(D.ID,D3.ID) AS DETAILS_LOCAL_ID ,
        D3.ID AS BUSINESS_LOCAL_ID ,
        D3.记录时间 AS RECORD_DATE ,
        NULL AS RESPIRATORY_RATE ,
        2 AS VENTILATOR_FLAG ,
         CASE  D3.项目名称 
		 WHEN '脉搏' THEN 
		   CASE WHEN D3.记录内容 IS NOT NULL AND LEN(D3.记录内容)>0 THEN
		    D3.记录内容  END
		 ELSE NULL END
		 AS PULSE_RATE ,
         CASE  D3.项目名称 
		 WHEN '心率' THEN 
		   CASE WHEN D3.记录内容 IS NOT NULL AND LEN(D3.记录内容)>0 THEN
		    D3.记录内容  END
		 ELSE NULL END AS HEART_PACEMAKER ,
         CASE  D3.项目名称 
		 WHEN '血压' THEN 
		 CASE WHEN D3.记录内容 IS NOT NULL AND LEN(D3.记录内容)>0 THEN
		 SUBSTRING(D3.记录内容,0,CHARINDEX('/',D3.记录内容)) END		
		 ELSE NULL END AS SBP ,
         CASE  D3.项目名称 
		 WHEN '血压' THEN 
		  CASE WHEN D3.记录内容 IS NOT NULL AND LEN(D3.记录内容)>0 THEN
		 dbo.SubStr(D3.记录内容,CHARINDEX('/',D3.记录内容)+1) END
		 ELSE NULL END AS DBP ,
         CASE  D3.项目名称 
		 WHEN '体温' THEN
		  CASE WHEN D3.记录内容 IS NOT NULL AND LEN(D3.记录内容)>0 THEN
		    D3.记录内容  END
		 ELSE NULL END AS TEMPERATURE ,
        2 AS SHORT_PULSE_LIGHT ,
        1 AS THERMOMETER_TYPE ,
        '腋表' AS THERMOMETER_NAME ,
        2 AS PHYSICAL_COOLING_FLAG ,
        NULL AS COOLING_TEMPERATURE_TREATMENT ,
        d3.记录时间 AS CREATE_DATE ,
        NULL AS UPDATE_DATE ,
        GETDATE() AS UPLOAD_TIME ,
        1 AS ESTATUS
FROM     dbo.病案主页 B
        LEFT JOIN dbo.部门表 B2 ON B.出院科室ID = B2.ID,
		dbo.病人护理文件 C ,
        dbo.病人护理数据 D,
        dbo.病人护理明细 D3 
WHERE   B.病人ID=C.病人ID AND B.主页ID=C.主页ID AND C.婴儿=0
		AND C.ID=D.文件ID AND C.格式ID <> 341
		AND D.ID=D3.记录ID
		AND D3.记录时间 between dateadd(day,-1, @Date_from) and @date_to
)M WHERE EXISTS(
  SELECT * FROM 
 (SELECT TOP 3000 BUSINESS_LOCAL_ID FROM OPENQUERY(YT,'SELECT BUSINESS_LOCAL_ID FROM MONITOR_VITAL_SIGNS_RECORD  
  ORDER BY CREATE_DATE DESC'))M2 WHERE M.BUSINESS_LOCAL_ID=M2.BUSINESS_LOCAL_ID ) 
END TRY
BEGIN CATCH
INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
VALUES('生命体征测量明细记录',ERROR_MESSAGE(),GETDATE())
END CATCH

--2.13.1.	手术知情同意书(OPERATION_INFORMED_CONSENT)（优先级3）
 BEGIN TRY
 INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE ,CLINIC_ORGAN_NAME ,DEPT_CODE,DEPT_NAME,PATIENT_LOCAL_ID,BUSINESS_LOCAL_ID,OUTPATIENT_NO,INPATIENT_NO,VISIT_COUNT,WARD_NAME,WARD_NUM,BED_NUM,NAME,GENDER_CODE,
 GENDER,AGE_YEAR,AGE_MONTH,PREOPERATIVE_DIAGNOSTIC_CODE,PREOPERATIVE_DIAGNOSTIC_NAME,IMPLEMENT_OPERATION_CODE,IMPLEMENT_OPERATION_NAME,IMPLEMENT_OPERATION_TIME,OPERATION_INDICATION,OPERATION_CONTRAINDICATION,
OPERATION_METHOD,IMPLEMENTED_CODE,IMPLEMENTED_NAME,PREOPERATIVE_PREPARATION,SURGERY_ACCIDENTS_RISK,SURGERY_ACCIDENTS_COMPLICAT,ALTERNATIVE,MEDICAL_ADVICE,STATUTORYL_SADVICE,PATIENT_SIG,PAANDLEGAL_SIGNATURE_DATETIME,LEGAL_REPRESENTATIVE_SIG,
PAANDLEGAL_RELATION_CODE,PAANDLEGAL_RELATION_NAME,LEGAL_SIGNATURE_DATETIME,DOCTOR_SIGNATURE,DOCTOR_SIGNATURE_TIME,OPERATOR_SIGNATURE,OPERATOR_SIGNATURE_TIME,STRUCT_FLAG,TEXT_CONTENT,CONTENT_TYPE,CREATE_DATE,UPDATE_DATE,
UPLOAD_TIME,ESTATUS FROM OPERATION_INFORMED_CONSENT')
SELECT * FROM(
SELECT   ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,        
       B.编码 AS DEPT_CODE,
	   B.名称 AS DEPT_NAME,
	   CONCAT(( SELECT ZZJGDM
                 FROM   dbo.T_JGGL
               ), A.病人ID) AS PATIENT_LOCAL_ID,
       C3.ID AS BUSINESS_LOCAL_ID,
	    null   AS  OUTPATIENT_NO,
	   A.住院号 AS INPATIENT_NO,
	   A.主页ID AS VISIT_COUNT,
	   B2.名称 AS WARD_NAME,
	 B3.房间号 AS WARD_NUM,
     A.出院病床 AS   BED_NUM,
	 A2.姓名 AS NAME,
	 CASE A2.性别 WHEN '男' THEN '1' ELSE '2' END  AS GENDER_CODE,
	  A2.性别  AS GENDER,
	 DATEDIFF(YEAR, A2.出生日期,A.入院日期) AS AGE_YEAR,
	 NULL  AS AGE_MONTH,
	 'O60.200' AS PREOPERATIVE_DIAGNOSTIC_CODE,
	 '提前自然临产伴足月产' AS  PREOPERATIVE_DIAGNOSTIC_NAME,
	  '74.1x01' AS  IMPLEMENT_OPERATION_CODE,
	  '剖宫产术子宫下段横切口' AS IMPLEMENT_OPERATION_NAME,
	 (SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_手术知情同意书(A.病人ID,A.主页ID) WHERE Name='手术/操作日期时间')  AS IMPLEMENT_OPERATION_TIME,
	 (SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_手术知情同意书(A.病人ID,A.主页ID) WHERE Name='手术指征') AS OPERATION_INDICATION,
	 (SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_手术知情同意书(A.病人ID,A.主页ID) WHERE Name='手术禁忌症') AS OPERATION_CONTRAINDICATION,
	 '剖宫产' AS OPERATION_METHOD,
	 '0201' AS IMPLEMENTED_CODE,
	 '椎管内麻醉' AS IMPLEMENTED_NAME,
	 --(SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_手术知情同意书(A.病人ID,A.主页ID) WHERE Name='麻醉方式')  AS IMPLEMENTED_NAME,
	 NULL  AS PREOPERATIVE_PREPARATION,
	 (SELECT ythis.dbo.Get_element_手术意外及风险(A.病人ID,A.主页ID))  AS SURGERY_ACCIDENTS_RISK,
	 (SELECT ythis.dbo.Get_element_手术并发症(A.病人ID,A.主页ID))  AS SURGERY_ACCIDENTS_COMPLICAT,
	 NULL AS ALTERNATIVE,
	 '谨遵医嘱' AS  MEDICAL_ADVICE,
	 '同意' AS STATUTORYL_SADVICE,
	 A2.姓名 AS PATIENT_SIG,
	 format(C3.完成时间,'yyyy-MM-dd HH:mm:ss') AS PAANDLEGAL_SIGNATURE_DATETIME,
	 NULL  AS  LEGAL_REPRESENTATIVE_SIG,
	 NULL  AS PAANDLEGAL_RELATION_CODE,
	 NULL AS  PAANDLEGAL_RELATION_NAME,
	 NULL  AS LEGAL_SIGNATURE_DATETIME,
	(SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_手术知情同意书(A.病人ID,A.主页ID) WHERE Name='医生签名') AS  DOCTOR_SIGNATURE,
	format(C3.完成时间,'yyyy-MM-dd HH:mm:ss') AS  DOCTOR_SIGNATURE_TIME,
	'满延强' AS OPERATOR_SIGNATURE,
	format(C3.完成时间,'yyyy-MM-dd HH:mm:ss') AS  OPERATOR_SIGNATURE_TIME,
	'1' AS STRUCT_FLAG,
	NULL  AS TEXT_CONTENT,
	NULL  AS CONTENT_TYPE,
	format(C3.CreateDate,'yyyy-MM-dd HH:mm:ss') AS CREATE_DATE,
	NULL  AS UPDATE_DATE,
	 GETDATE() AS UPLOAD_TIME,
	 1 AS ESTATUS
	 FROM dbo.病案主页 A(NOLOCK)
	 LEFT JOIN 病人信息 A2 ON A.病人ID=A2.ID
	 LEFT JOIN dbo.部门表 B ON A.出院科室ID =B.ID
	 LEFT JOIN dbo.部门表 B2 ON A.入院病区ID=B2.ID
	 LEFT JOIN dbo.床位状况记录 B3 ON A.出院病床=B3.床号 AND A.当前病区ID=B3.病区ID,
      YTDOC.dbo.T_DocList C3 
	 WHERE  A.入院日期 BETWEEN @Date_from AND @date_to
	 AND A.病人ID=C3.PatientID 
	 AND A.主页ID=C3.主页ID 
	 AND c3.Title like '%手术知情同意书%标准%%'
	 --EXISTS(SELECT * FROM YTDOC.DBO.T_Template WHERE C3.TemplateID=ID AND MBMC LIKE '%手术知情同意书标准%')
)M 
 END TRY
 BEGIN CATCH
 INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
 VALUES('手术知情同意书',ERROR_MESSAGE(),GETDATE())
 END CATCH

 --2.13.6.特殊检查及特殊治疗同意书(SPECIAL_TREATMENT_CONSENT)（优先级3）
BEGIN TRY
 INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE,CLINIC_ORGAN_NAME,DEPT_CODE,DEPT_NAME,PATIENT_LOCAL_ID,BUSINESS_LOCAL_ID,OUTPATIENT_NO,INPATIENT_NO,VISIT_COUNT,WARD_NAME,WARD_NUM,BED_NUM,
 NAME,GENDER_CODE,GENDER,AGE_YEAR,AGE_MONTH,DIS_DIAG_CODE,DIS_DIAG_NAME,SPEXAMINAT_SPTREAT_ITEM,SPECIAL_INSPEC_SPEC_TREAT,SPEXAMINATIONS_SPTREAT_COMPL,ALTERNATIVE,MEDICAL_ADVICE,STATUTORYL_SADVICE,PATIENT_SIG,
 PAANDLEGAL_SIGNATURE_DATETIME,LEGAL_REPRESENTATIVE_SIG,LEGAL_REPRESENTATIVE,PAANDLEGAL_RELATION_NAME,LEGAL_SIGNATURE_DATETIME,DOCTOR_SIGNATURE,DOCTOR_SIGNATURE_TIME,STRUCT_FLAG,
 TEXT_CONTENT,CONTENT_TYPE,CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS FROM SPECIAL_TREATMENT_CONSENT')
SELECT * FROM(
SELECT   ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS  CLINIC_ORGAN_CODE,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME,
       B.编码 AS DEPT_CODE,
	   B.名称 AS  DEPT_NAME,
	   CONCAT(( SELECT ZZJGDM
                 FROM   dbo.T_JGGL
               ), A.病人ID) AS PATIENT_LOCAL_ID,
       C3.ID AS BUSINESS_LOCAL_ID,
	    null   AS  OUTPATIENT_NO,
	   A.住院号 AS INPATIENT_NO,
	   A.主页ID AS VISIT_COUNT,
	   B2.名称 AS WARD_NAME,
	 B3.房间号 AS WARD_NUM,
     A.出院病床 AS  BED_NUM,
	 A2.姓名 AS NAME,
	 CASE A2.性别 WHEN '男' THEN '1' ELSE '2' END  AS GENDER_CODE,
	  A2.性别  AS GENDER,
	 DATEDIFF(YEAR, A2.出生日期,A.入院日期) AS AGE_YEAR,
	 NULL  AS AGE_MONTH,
	  F1.编码 AS DIS_DIAG_CODE,
	  F.诊断描述 AS  DIS_DIAG_NAME,
	 (SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_特殊治疗同意书(A.病人ID,A.主页ID) WHERE Name='治疗项目名称')  AS SPEXAMINAT_SPTREAT_ITEM,
	 NULL AS  SPECIAL_INSPEC_SPEC_TREAT,
	 NULL  AS SPEXAMINATIONS_SPTREAT_COMPL,
	 NULL  AS ALTERNATIVE,
	 NULL AS MEDICAL_ADVICE,
	 '同意' AS STATUTORYL_SADVICE,
	 A2.姓名 AS PATIENT_SIG,
	 (SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_特殊治疗同意书(A.病人ID,A.主页ID) WHERE Name='法定代理人签名日期') AS PAANDLEGAL_SIGNATURE_DATETIME,
	 (SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_特殊治疗同意书(A.病人ID,A.主页ID) WHERE Name='法定代理人签名') AS LEGAL_REPRESENTATIVE_SIG,
	'1'  AS LEGAL_REPRESENTATIVE,
	'配偶' AS  PAANDLEGAL_RELATION_NAME,
	(SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_特殊治疗同意书(A.病人ID,A.主页ID) WHERE Name='法定代理人签名日期') AS  LEGAL_SIGNATURE_DATETIME,
	(SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_特殊治疗同意书(A.病人ID,A.主页ID) WHERE Name='医生签名') AS DOCTOR_SIGNATURE,
	(SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_特殊治疗同意书(A.病人ID,A.主页ID) WHERE Name='法定代理人签名日期') AS DOCTOR_SIGNATURE_TIME,
	'1' AS STRUCT_FLAG,
	NULL AS TEXT_CONTENT,
	NULL  AS CONTENT_TYPE,
	format(C3.CreateDate,'yyyy-MM-dd HH:mm:ss') AS CREATE_DATE,
	NULL  AS UPDATE_DATE,
	 GETDATE() AS UPLOAD_TIME,
	 1 AS ESTATUS
	 FROM dbo.病案主页 A(NOLOCK)
	 LEFT JOIN 病人信息 A2 ON A.病人ID=A2.ID
	 LEFT JOIN dbo.部门表 B ON A.出院科室ID =B.ID
	 LEFT JOIN dbo.部门表 B2 ON A.入院病区ID=B2.ID
	 LEFT JOIN dbo.床位状况记录 B3 ON A.出院病床=B3.床号 AND A.当前病区ID=B3.病区ID
	 LEFT JOIN dbo.病人诊断记录 F ON F.病人id=A.病人ID AND F.主页id=A.主页id AND F.诊断类型=1 AND F.诊断次序=1
	 LEFT JOIN dbo.疾病编码目录 F1 ON F1.id=F.疾病ID  AND F.诊断类型=1 AND F.诊断次序=1,
      YTDOC.dbo.T_DocList C3 
	 WHERE  A.入院日期 BETWEEN @Date_from AND @date_to
	 AND A.病人ID=C3.PatientID 
	 AND A.主页ID=C3.主页ID 
	 AND c3.title LIKE '%阴道电极理疗同意书%'
	 --EXISTS(SELECT * FROM YTDOC.DBO.T_Template WHERE C3.TemplateID=ID AND MBMC LIKE '%手术知情同意书标准%')
)M 
 END TRY
 BEGIN CATCH
 INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
 VALUES('特殊检查及特殊治疗同意书',ERROR_MESSAGE(),GETDATE())
 END CATCH


--2.13.6.其他知情告知同意书(OTHER_INFORMED_CONSENT)（优先级3）
BEGIN TRY
 INSERT INTO OPENQUERY(YT,'SELECT CLINIC_ORGAN_CODE ,CLINIC_ORGAN_NAME ,DEPT_CODE,DEPT_NAME,PATIENT_LOCAL_ID,BUSINESS_LOCAL_ID,INFORMED_CONSENT_NAME,OUTPATIENT_NO,INPATIENT_NO,VISIT_COUNT,WARD_NAME,WARD_NUM,BED_NUM,
NAME,GENDER_CODE,GENDER,AGE_YEAR,AGE_MONTH,DIS_DIAG_CODE,DIS_DIAG_NAME,INFORMED_CONSENT_CONTENT,MEDICAL_ADVICE,STATUTORYL_SADVICE,PATIENT_SIG,PAANDLEGAL_SIGNATURE_DATETIME,LEGAL_REPRESENTATIVE_SIG,PAANDLEGAL_RELATION_CODE,
PAANDLEGAL_RELATION_NAME,LEGAL_SIGNATURE_DATETIME,DOCTOR_SIGNATURE,DOCTOR_SIGNATURE_DATETIME,STRUCT_FLAG,TEXT_CONTENT,CONTENT_TYPE,CREATE_DATE,UPDATE_DATE,UPLOAD_TIME,ESTATUS FROM OTHER_INFORMED_CONSENT')
SELECT * FROM(
SELECT   ( SELECT    ZZJGDM
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_CODE ,
        ( SELECT    JGMC
          FROM      dbo.T_JGGL
        ) AS CLINIC_ORGAN_NAME ,        
       B.编码 AS DEPT_CODE,
	   B.名称 AS DEPT_NAME,
	   CONCAT(( SELECT ZZJGDM
                 FROM   dbo.T_JGGL
               ), A.病人ID) AS PATIENT_LOCAL_ID,
       C3.ID AS BUSINESS_LOCAL_ID,
	  C3.Title  AS INFORMED_CONSENT_NAME,
	    null   AS  OUTPATIENT_NO,
	   A.住院号 AS INPATIENT_NO,
	   A.主页ID AS VISIT_COUNT,
	   B2.名称 AS WARD_NAME,
	 B3.房间号 AS WARD_NUM,
     A.出院病床 AS   BED_NUM,
	 A2.姓名 AS NAME,
	 CASE A2.性别 WHEN '男' THEN '1' ELSE '2' END  AS GENDER_CODE,
	  A2.性别  AS GENDER,
	 DATEDIFF(YEAR, A2.出生日期,A.入院日期) AS AGE_YEAR,
	 NULL  AS AGE_MONTH,
	 'O60.200' AS DIS_DIAG_CODE,
	  F.诊断描述 AS  DIS_DIAG_NAME,
	 (SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_阴道分娩同意书(A.病人ID,A.主页ID) WHERE Name='知情同意书内容')  AS INFORMED_CONSENT_CONTENT,
	 (SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_阴道分娩同意书(A.病人ID,A.主页ID) WHERE Name='医疗机构意见') AS MEDICAL_ADVICE,
	 '同意' AS STATUTORYL_SADVICE,
	 A2.姓名 AS PATIENT_SIG,
	 (SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_阴道分娩同意书(A.病人ID,A.主页ID) WHERE Name='法定代理人签名日期') AS PAANDLEGAL_SIGNATURE_DATETIME,
	 (SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_阴道分娩同意书(A.病人ID,A.主页ID) WHERE Name='法定代理人签名') AS LEGAL_REPRESENTATIVE_SIG,
	'1'  AS PAANDLEGAL_RELATION_CODE,
	'配偶' AS  PAANDLEGAL_RELATION_NAME,
	(SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_阴道分娩同意书(A.病人ID,A.主页ID) WHERE Name='法定代理人签名日期') AS  LEGAL_SIGNATURE_DATETIME,
	(SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_阴道分娩同意书(A.病人ID,A.主页ID) WHERE Name='医生签名') AS DOCTOR_SIGNATURE,
	(SELECT CASE WHEN LEN(value)>0 THEN value ELSE NULL END FROM dbo.Fn_阴道分娩同意书(A.病人ID,A.主页ID) WHERE Name='法定代理人签名日期') AS DOCTOR_SIGNATURE_DATETIME,
	'1' AS STRUCT_FLAG,
	NULL  AS TEXT_CONTENT,
	NULL  AS CONTENT_TYPE,
	format(C3.CreateDate,'yyyy-MM-dd HH:mm:ss') AS CREATE_DATE,
	NULL  AS UPDATE_DATE,
	 GETDATE() AS UPLOAD_TIME,
	 1 AS ESTATUS
	 FROM dbo.病案主页 A(NOLOCK)
	 LEFT JOIN 病人信息 A2 ON A.病人ID=A2.ID
	 LEFT JOIN dbo.部门表 B ON A.出院科室ID =B.ID
	 LEFT JOIN dbo.部门表 B2 ON A.入院病区ID=B2.ID
	 LEFT JOIN dbo.床位状况记录 B3 ON A.出院病床=B3.床号 AND A.当前病区ID=B3.病区ID
	 LEFT JOIN dbo.病人诊断记录 F ON F.病人id=A.病人ID AND F.主页id=A.主页id AND F.诊断类型=1 AND F.诊断次序=1,
      YTDOC.dbo.T_DocList C3 
	 WHERE  A.入院日期 BETWEEN @Date_from AND @date_to
	 AND A.病人ID=C3.PatientID 
	 AND A.主页ID=C3.主页ID 
	 AND c3.TemplateID=9426
	 --EXISTS(SELECT * FROM YTDOC.DBO.T_Template WHERE C3.TemplateID=ID AND MBMC LIKE '%手术知情同意书标准%')
)M 
 END TRY
 BEGIN CATCH
 INSERT INTO 药监平台日志(TabName,MessAgeInfo,RecordTime) 
 VALUES('其他知情告知同意书',ERROR_MESSAGE(),GETDATE())
 END CATCH