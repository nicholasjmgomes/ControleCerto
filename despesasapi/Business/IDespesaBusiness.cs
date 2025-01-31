using despesasapi.Model;
using despesasapi.Repository;

namespace despesasapi.Business
{
    public interface IDespesaBusiness
    {
        Despesa AdicionarDespesa(Despesa despesa);

        Despesa BuscarPorId(long id);

        List<Despesa> BuscarTodos();

        Despesa EditarDespesa(Despesa despesa);

        void ExcluirDespesa(long id);
    }
}
