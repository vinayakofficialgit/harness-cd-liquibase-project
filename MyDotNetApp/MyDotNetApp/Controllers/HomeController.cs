using Microsoft.AspNetCore.Mvc;

namespace MyDotNetApp.Controllers
{
    public class HomeController : Controller
    {
        [HttpGet("/")]
        public IActionResult Index()
        {
            return Content("Welcome to vin latest MyDotNetApp!");
        }
    }
}

