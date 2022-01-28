using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Mvc;
using mitrozassigment.Models;

namespace mitrozassigment.Controllers
{
    public class EmployeeController : Controller
    {
        // GET: Employee
        public ActionResult Index()
        {
            return View();
        }
        public ActionResult SaveEmployee(EmployeeMODEL model)
        {
            try
            {
                return Json(new { Message = (new EmployeeMODEL().SaveEmployee(model)) }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception Ex)
            {
                return Json(new { Ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult Getemployedetail()
        {
            try
            {
                return Json(new { model = (new EmployeeMODEL().GetEmpdetails()) }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception Ex)
            {
                return Json(new { Ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult DeleteEmp(int E_ID)
        {
            try
            {
                return Json(new { model = (new EmployeeMODEL().DeleteEmp(E_ID)) }, JsonRequestBehavior.AllowGet);
            }
            catch (Exception Ex)
            {
                return Json(new { Ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }

        public ActionResult EditEmp(int E_ID)
        {
            try
            {
                return Json(new { model = (new EmployeeMODEL().EditEmp(E_ID)) },JsonRequestBehavior.AllowGet);
            }
            catch (Exception Ex)
            {
                return Json(new { Ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }
        public ActionResult getdepartment()
        {
            try
            {
                return Json(new { model = (new EmployeeMODEL().getdepartment()) },JsonRequestBehavior.AllowGet);
            }
            catch (Exception Ex)
            {
                return Json(new { Ex.Message }, JsonRequestBehavior.AllowGet);
            }
        }
    }
}