using Microsoft.AspNetCore.Mvc;

namespace NetCore.Controllers
{
    [ApiController]
    [Route("api/[controller]")]
    public class PingController : ControllerBase
    {
        [HttpGet]
        public IActionResult Get()
        {
            var message = "Api is working!";
            return Ok(message);
        }
    }
}