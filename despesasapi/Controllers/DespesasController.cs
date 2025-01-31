using despesasapi.Business;
using despesasapi.Model;
using Microsoft.AspNetCore.Mvc;

namespace despesasapi.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class DespesasController : ControllerBase
    {
        private readonly ILogger<DespesasController> _logger;
        private IDespesaBusiness _despesaBusiness;

        public DespesasController(ILogger<DespesasController> logger, IDespesaBusiness despesaBusiness)
        {
            _logger = logger;
            _despesaBusiness = despesaBusiness;
        }

        [HttpGet]
        public IActionResult Get() 
        { 
            return Ok(_despesaBusiness.BuscarTodos());
        }

        [HttpGet("{id}")]
        public IActionResult Get(long id) 
        {
            var despesa = _despesaBusiness.BuscarPorId(id);

            if (despesa == null) 
            {
                return NotFound();
            }

            return Ok(despesa);
        }

        [HttpPost]
        public IActionResult Post([FromBody] Despesa despesa) 
        {
            if (despesa == null) 
            {
                return BadRequest();
            }

            return Ok(_despesaBusiness.AdicionarDespesa(despesa));
        }

        [HttpPut]
        public IActionResult Put([FromBody] Despesa despesa) 
        {
            if (despesa == null) 
            {
                return BadRequest();
            }

            return Ok(_despesaBusiness.EditarDespesa(despesa));
        }

        [HttpDelete("{id}")]
        public IActionResult Delete(long id) 
        {
            _despesaBusiness.ExcluirDespesa(id);
            return NoContent();
        }
    }
}
