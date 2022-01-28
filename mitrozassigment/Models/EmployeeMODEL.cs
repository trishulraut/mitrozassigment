using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using mitrozassigment.Data;
using System.Data.SqlClient;
using System.Data;
using System.Data.Common;
using System.ComponentModel.DataAnnotations.Schema;
using System.ComponentModel.DataAnnotations;

namespace mitrozassigment.Models
{
    public class EmployeeMODEL
    {
        public int E_ID { get; set; }
        public string Name { get; set; }
        public string Address { get; set; }
        [RegularExpression(@"\+91[0-9]{10}",ErrorMessage ="Mobile Number is Invalid")]
        public string Mobile_No { get; set; }
        public string Email { get; set; }
        public int DeptId { get; set; }
        public string DEPT_NAME { get; set; }
        public string SaveEmployee(EmployeeMODEL model)
        {
            string Message = "";
            mitrozassigmentEntities db = new mitrozassigmentEntities();
            var getCatData = db.TblEmployees.Where(p => p.E_ID == model.E_ID).FirstOrDefault();
            if (getCatData == null)
            {
                var saveEmployee = new TblEmployee()
                {
                E_ID = model.E_ID,
                Name = model.Name,
                Address = model.Address,
                Mobile_No = model.Mobile_No,
                Email = model.Email,
                DeptId = model.DeptId,
            };
           db.TblEmployees.Add(saveEmployee);
           db.SaveChanges();
           return Message;
            }
            else
            {
                getCatData.Name = model.Name;
                getCatData.Address = model.Address;
                getCatData.Mobile_No = model.Mobile_No;
                getCatData.Email = model.Email;
                getCatData.DeptId = model.DeptId;
            };
            db.SaveChanges();
            Message = "Updated Sucessfully";

            return Message;
        }
        public List<EmployeeMODEL> GetEmpdetails()
        {
            mitrozassigmentEntities db = new mitrozassigmentEntities();
            List<EmployeeMODEL> lstemp= new List<EmployeeMODEL>();
            DataTable dtTable = new DataTable();
            using (var cmd = db.Database.Connection.CreateCommand())
            {
                db.Database.Connection.Open();
                cmd.CommandText = "uspgetemployeelist";
                cmd.CommandType = CommandType.StoredProcedure;
                DbDataAdapter da = DbProviderFactories.GetFactory("System.Data.SqlClient").CreateDataAdapter();
                da.SelectCommand = cmd;
                da.Fill(dtTable);
                db.Database.Connection.Close();  
            }

            foreach (DataRow dr in dtTable.Rows)
            {
                EmployeeMODEL blmodel = new EmployeeMODEL();
                blmodel.E_ID = Convert.ToInt32(dr["E_ID"].ToString());
                blmodel.Name = (dr["Name"].ToString());
                blmodel.Address = (dr["Address"].ToString());
                blmodel.Email = (dr["Email"].ToString());
                blmodel.Mobile_No = (dr["Mobile_No"].ToString());
                blmodel.DEPT_NAME = (dr["DEPT_NAME"].ToString());
                lstemp.Add(blmodel);
            }

          

            return lstemp;
        }

        public string DeleteEmp(int E_ID)
        {
            string Message = "Record Deleted Successfully";
            mitrozassigmentEntities Db = new mitrozassigmentEntities();
            var deleteRecord = Db.TblEmployees.Where(p => p.E_ID == E_ID).FirstOrDefault();
            if (deleteRecord != null)
            {
                Db.TblEmployees.Remove(deleteRecord);
            };
            Db.SaveChanges();
            
            return Message;
        }



        public EmployeeMODEL EditEmp(int E_ID)
        {
            string Message = "";
            EmployeeMODEL model = new EmployeeMODEL();
            mitrozassigmentEntities Db = new mitrozassigmentEntities();
            var editemp = Db.TblEmployees.Where(p => p.E_ID == E_ID).FirstOrDefault();
            if (editemp != null)
            {
                model.E_ID = editemp.E_ID;
                model.Name = editemp.Name;
                model.Address = editemp.Address;
                model.Mobile_No = editemp.Mobile_No;
                model.Email = editemp.Email;
                model.DeptId = editemp.DeptId;
            }

            Message = "Confirm Edit Detail";
            return model;
        }

        public List<EmployeeMODEL> getdepartment()
        {
            mitrozassigmentEntities db = new mitrozassigmentEntities();
            List<EmployeeMODEL> deptlst = new List<EmployeeMODEL>();
            var deptsd = db.TblDeparments.ToList();
            if (deptsd != null)
            {
                foreach (var dept in deptsd)
                {
                    deptlst.Add(new EmployeeMODEL()
                    {
                        DeptId = dept.DeptId,
                        DEPT_NAME = dept.DEPT_NAME,
                    });
                }
            }
            return deptlst;
        }

    }
}