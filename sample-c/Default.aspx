<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="_Default" %>
<%@ Import Namespace="System.IO" %>
<%@ Import Namespace="System.Net" %>
<%@ Import Namespace="Newtonsoft.Json" %>


<%
    string apikey = "abcdef"; //Get your API key from configuration manager. Keep the api key secret and not share with anyone.  
    
    string document = "test.xlsx"; //Pass document from your application. This can be url or document name. If passing document name, set network or server document location in Configuration Manager
    string userName = "John"; //Pass user name from your application
    //Look in developer guide on other parameters that can be passed.
    
    string sessionid;

    
    
         
    //STEP 1. Get the sessionid
    
    string apiurl;

    apiurl = "http://localhost:19121/api/1.0.0/createBreadSession?apikey=" + apikey + "&document=" + document + "&userName=" + userName;
    HttpWebRequest HttpWReq = (HttpWebRequest)WebRequest.Create(apiurl);
    HttpWebResponse HttpWResp = (HttpWebResponse)HttpWReq.GetResponse();
    StreamReader sr = new StreamReader(HttpWResp.GetResponseStream(), System.Text.Encoding.UTF8);
    String resjson = sr.ReadToEnd();

    _breadsheetsession responseJson = JsonConvert.DeserializeObject<_breadsheetsession>(resjson);
  
    if (responseJson.code != "0")
    {
            Response.Write("Some Error Occurred");
            Response.End();
    }
    else
    {
        sessionid = responseJson.data.sessionid;

     //STEP 2. Pass the sessionid to embed code

 %>
<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Bread</title>
</head>
<body>
 
 <style>
 
 .breadsheets{   
	margin: 0 auto;
	display:block;
	
	-moz-border-radius: 5px;   
	-webkit-border-radius: 5px;   
	border-radius: 5px;   
	-moz-box-shadow: 0 0 1em #000;;   
	-webkit-box-shadow: 0 0 1em #000;   
	box-shadow: 0 0 1em #000;   
	
);

 </style>


<script type="text/javascript">
    var _breadurl = "demo.breadsoftware.com";
    var _breadsheet = [];
    _breadsheet.push(['sessionId', '<%=sessionid %>']);  // 
    _breadsheet.push(['width', '900px']); //width of editor. To fit browser width, set to 100%. Can also be set in pixels like 800px for fixed width
    _breadsheet.push(['height', '600px']); //height of editor. To fit browser height, set to 100%. Can also be set in pixels like 600px for fixed height
   
    
    (function () {
        var bd = document.createElement('script'); bd.type = 'text/javascript'; bd.async = true;
        bd.src = ('https:' == document.location.protocol ? 'https://ssl' : 'http://') + _breadurl + '/breadsheets/static/breadsheets.js';
        var s = document.getElementsByTagName('script')[0]; s.parentNode.insertBefore(bd, s);
    })();
</script>
<div id="breadsheets"></div>
 
</body>
</html>


<%
    
      }
        
    HttpWResp.Close();
    sr.Close();
 %>