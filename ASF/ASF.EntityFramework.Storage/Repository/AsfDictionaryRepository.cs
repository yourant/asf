using ASF.Domain.Entities;
using ASF.Infrastructure.Repositories;

namespace ASF.EntityFramework.Repository
{
    public class AsfDictionaryRepository: Repositories<AsfDictionary>,IAsfDictionaryRepository
    {
        public AsfDictionaryRepository(RepositoryContext context) : base(context)
        {
        }
    }
}