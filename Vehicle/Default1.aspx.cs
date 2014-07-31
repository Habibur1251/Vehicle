using System;
using System.Configuration;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using VehicleMaintenanceSystem;

using System.Collections.Generic;


namespace VehicleMaintenanceSystem.Vehicle
{

    public partial class Default1 : System.Web.UI.Page
    {
       

        private int intCurrentRecordNumber = 0;
        private int intRecordsPerPage = 20;

      

        protected void Page_Load(object sender, EventArgs e)
        {
            FilleGridView();
        }

        /// <summary>
        ///  Adding Page-Break after specific number of record
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void GridView2_RowDataBound(object sender, GridViewRowEventArgs e)
        {
            if (e.Row.RowType == DataControlRowType.DataRow)
            {
                
                
                this.intCurrentRecordNumber++;
                if (this.intCurrentRecordNumber >= this.intRecordsPerPage)
                {
                    e.Row.Attributes.Add("style", @"page-break-after:always;");
                    this.intCurrentRecordNumber = 0;
                }
            }
        }


       
        private void FilleGridView()
        {
            // Get the XML Path : 
            string strXML = Server.MapPath("books.xml");
            DataSet dst = new DataSet();
            dst.ReadXml(strXML);
           
            // Bind the Grid View :
            GridView2.DataSource = dst;
            GridView2.DataBind();
            
           
            
        }

        
    }
}