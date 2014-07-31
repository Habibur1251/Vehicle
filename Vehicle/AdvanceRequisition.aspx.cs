using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;

namespace HR.WEB.UI
{
    public partial class AdvanceRequisition : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {            
           DataTable dt = new DataTable();
            grdPreviousAdvance.DataSource = dt;

        }
    }
}