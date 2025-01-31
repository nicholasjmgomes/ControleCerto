using System.ComponentModel.DataAnnotations.Schema;
using despesasapi.Enum;

namespace despesasapi.Model
{
    [Table("despesa")]
    public class Despesa
    {
        [Column("id")]
        public long Id { get; set; }

        [Column("nome_despesa")]
        public string NomeDespesa { get; set; }

        [Column("valor")]
        public double Valor {  get; set; }

        [Column("data")]
        public DateTime Data {  get; set; }

        [Column("descricao")]
        public string Descricao { get; set; }

        [Column("categoria")]
        public TipoDespesa Categoria { get; set; }

        [Column("forma_pagamento")]
        public FormaPagamento FormaPagamento { get; set; }
    }
}
