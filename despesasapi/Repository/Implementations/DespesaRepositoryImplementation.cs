using aspdotnetestudo.Model.Context;
using despesasapi.Model;

namespace despesasapi.Repository.Implementations
{
    public class DespesaRepositoryImplementation : IDespesaRepository
    {
        private MySQLContext _context;
        public DespesaRepositoryImplementation(MySQLContext context) 
        {
         _context = context;
        }

        public Despesa AdicionarDespesa(Despesa despesa)
        {
            try
            {
                _context.Add(despesa);
                _context.SaveChanges();
            }
            catch (Exception)
            {

                throw;
            }
            return despesa;
        }

        public Despesa BuscarPorId(long id)
        {
            var result = _context.Despesa.SingleOrDefault(x => x.Id.Equals(id));
            return result!;
        }

        public List<Despesa> BuscarTodos()
        {
            var result = _context.Despesa.ToList();
            return result;
        }

        public Despesa EditarDespesa(Despesa despesa)
        {
            if (!Exists(despesa.Id)) return null;

            var result = _context.Despesa.SingleOrDefault(x => x.Id.Equals(despesa.Id));

            if (result != null) 
            {
                try
                {
                    _context.Entry(result).CurrentValues.SetValues(despesa);
                    _context.SaveChanges();
                }
                catch (Exception)
                {

                    throw;
                }
            }

            return despesa;
        }

        public void ExcluirDespesa(long id)
        {
            var result = _context.Despesa.SingleOrDefault(x => x.Id.Equals(id));

            if (result != null)
            {
                try
                {
                    _context.Despesa.Remove(result);
                    _context.SaveChanges();
                }
                catch (Exception)
                {
                    throw;
                }
            }
        }

        public bool Exists(long id)
        {
            var result = _context.Despesa.Any(x => x.Id.Equals(id));
            return result;
        }
    }
}
