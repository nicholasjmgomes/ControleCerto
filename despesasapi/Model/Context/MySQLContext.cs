using despesasapi.Model;
using Microsoft.EntityFrameworkCore;

namespace aspdotnetestudo.Model.Context
{
    public class MySQLContext : DbContext
    {

        public MySQLContext()
        {

        }

        public MySQLContext(DbContextOptions<MySQLContext> options) : base(options)
        { }

        public DbSet<Despesa> Despesa { get; set; }
    }
}
