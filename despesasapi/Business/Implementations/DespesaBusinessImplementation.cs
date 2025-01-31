using despesasapi.Model;
using despesasapi.Repository;

namespace despesasapi.Business.Implementations
{
    public class DespesaBusinessImplementation : IDespesaBusiness
    {
        private readonly IDespesaRepository _repository;

        public DespesaBusinessImplementation(IDespesaRepository repository) 
        {
            _repository = repository;
        }

        public Despesa AdicionarDespesa(Despesa despesa)
        {
            var result = _repository.AdicionarDespesa(despesa);
            return result;
        }

        public Despesa BuscarPorId(long id)
        {
            var result = _repository.BuscarPorId(id);
            return result;
        }

        public List<Despesa> BuscarTodos()
        {
            var result = _repository.BuscarTodos();
            return result;
        }

        public Despesa EditarDespesa(Despesa despesa)
        {
            var result = _repository.EditarDespesa(despesa);
            return result;
        }

        public void ExcluirDespesa(long id)
        {
            _repository.ExcluirDespesa(id);
        }
    }
}
