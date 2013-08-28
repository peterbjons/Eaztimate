using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

/// <summary>
/// Summary description for TextsObject
/// </summary>
public class GetTextsObject
{
    public List<Row> GetTextsResult;
    
    public GetTextsObject() {
        GetTextsResult = new List<Row>();
    }

    public class Row {
        public string fltId { get; set; }
        public string fltCode { get; set; }
        public string fltText { get; set; }
    }
}