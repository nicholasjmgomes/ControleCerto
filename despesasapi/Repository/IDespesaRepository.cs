using despesasapi.Model;

namespace despesasapi.Repository
{
    public interface IDespesaRepository
    {
        Despesa AdicionarDespesa(Despesa despesa);

        Despesa BuscarPorId(long id);

        List<Despesa> BuscarTodos();

        Despesa EditarDespesa(Despesa despesa);

        void ExcluirDespesa(long id);

        bool Exists(long id);
    }
}
