using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Rendering;
using Microsoft.EntityFrameworkCore;
using ProyectoHotel.Models;

namespace ProyectoHotel.Controllers
{
    public class CheckOutsController : Controller
    {
        private readonly HotelYesPleaseContext _context;

        public CheckOutsController(HotelYesPleaseContext context)
        {
            _context = context;
        }

        // GET: CheckOuts
        public async Task<IActionResult> Index()
        {
            var hotelYesPleaseContext = _context.CheckOuts.Include(c => c.IdReservaNavigation);
            return View(await hotelYesPleaseContext.ToListAsync());
        }

        // GET: CheckOuts/Details/5
        public async Task<IActionResult> Details(int? id)
        {
            if (id == null || _context.CheckOuts == null)
            {
                return NotFound();
            }

            var checkOut = await _context.CheckOuts
                .Include(c => c.IdReservaNavigation)
                .FirstOrDefaultAsync(m => m.IdCheckOut == id);
            if (checkOut == null)
            {
                return NotFound();
            }

            return View(checkOut);
        }

        // GET: CheckOuts/Create
        public IActionResult Create()
        {
            ViewData["IdReserva"] = new SelectList(_context.Reservas, "IdReserva", "IdReserva");
            return View();
        }

        // POST: CheckOuts/Create
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Create([Bind("IdCheckOut,IdReserva,FechaCheckOut,Estado")] CheckOut checkOut)
        {
            if (ModelState.IsValid)
            {
                _context.Add(checkOut);
                await _context.SaveChangesAsync();
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdReserva"] = new SelectList(_context.Reservas, "IdReserva", "IdReserva", checkOut.IdReserva);
            return View(checkOut);
        }

        // GET: CheckOuts/Edit/5
        public async Task<IActionResult> Edit(int? id)
        {
            if (id == null || _context.CheckOuts == null)
            {
                return NotFound();
            }

            var checkOut = await _context.CheckOuts.FindAsync(id);
            if (checkOut == null)
            {
                return NotFound();
            }
            ViewData["IdReserva"] = new SelectList(_context.Reservas, "IdReserva", "IdReserva", checkOut.IdReserva);
            return View(checkOut);
        }

        // POST: CheckOuts/Edit/5
        // To protect from overposting attacks, enable the specific properties you want to bind to.
        // For more details, see http://go.microsoft.com/fwlink/?LinkId=317598.
        [HttpPost]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> Edit(int id, [Bind("IdCheckOut,IdReserva,FechaCheckOut,Estado")] CheckOut checkOut)
        {
            if (id != checkOut.IdCheckOut)
            {
                return NotFound();
            }

            if (ModelState.IsValid)
            {
                try
                {
                    _context.Update(checkOut);
                    await _context.SaveChangesAsync();
                }
                catch (DbUpdateConcurrencyException)
                {
                    if (!CheckOutExists(checkOut.IdCheckOut))
                    {
                        return NotFound();
                    }
                    else
                    {
                        throw;
                    }
                }
                return RedirectToAction(nameof(Index));
            }
            ViewData["IdReserva"] = new SelectList(_context.Reservas, "IdReserva", "IdReserva", checkOut.IdReserva);
            return View(checkOut);
        }

        // GET: CheckOuts/Delete/5
        public async Task<IActionResult> Delete(int? id)
        {
            if (id == null || _context.CheckOuts == null)
            {
                return NotFound();
            }

            var checkOut = await _context.CheckOuts
                .Include(c => c.IdReservaNavigation)
                .FirstOrDefaultAsync(m => m.IdCheckOut == id);
            if (checkOut == null)
            {
                return NotFound();
            }

            return View(checkOut);
        }

        // POST: CheckOuts/Delete/5
        [HttpPost, ActionName("Delete")]
        [ValidateAntiForgeryToken]
        public async Task<IActionResult> DeleteConfirmed(int id)
        {
            if (_context.CheckOuts == null)
            {
                return Problem("Entity set 'HotelYesPleaseContext.CheckOuts'  is null.");
            }
            var checkOut = await _context.CheckOuts.FindAsync(id);
            if (checkOut != null)
            {
                _context.CheckOuts.Remove(checkOut);
            }
            
            await _context.SaveChangesAsync();
            return RedirectToAction(nameof(Index));
        }

        private bool CheckOutExists(int id)
        {
          return (_context.CheckOuts?.Any(e => e.IdCheckOut == id)).GetValueOrDefault();
        }
    }
}
