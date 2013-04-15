<%@ Application Language="C#" %>
<%@ Import Namespace="Eaztimate" %>
<%@ Import Namespace="System.Web.Optimization" %>
<%@ Import Namespace="System.Web.Http" %>
<%@ Import Namespace="System.Net.Http" %>
<%@ Import Namespace="System.Web.Http.WebHost" %>
<%@ Import Namespace="System.Web.Routing" %>

<script runat="server">

    void Application_Start(object sender, EventArgs e)
    {
        // Code that runs on application startup
        BundleConfig.RegisterBundles(BundleTable.Bundles);
        AuthConfig.RegisterOpenAuth();
        RouteTable.Routes.MapHttpRoute(
            name: "CounterApi",
            routeTemplate: "service/{controller}/{sysid}/{reportid}/{caseid}/{email}/{sha}",
            defaults: new { id = System.Web.Http.RouteParameter.Optional }
        );
        RouteTable.Routes.MapHttpRoute(
            name: "JourSyncApi",
            routeTemplate: "service/{controller}/{sysid}/{caseid}/{email}/{sha}",
            defaults: new { id = System.Web.Http.RouteParameter.Optional }
        );

        RouteTable.Routes.MapHttpRoute(
            name: "JourLoginApi",
            routeTemplate: "service/{controller}/{email}/{pw}/{sha}",
            defaults: new { id = System.Web.Http.RouteParameter.Optional }
        );
    }
    
    void Application_End(object sender, EventArgs e)
    {
        //  Code that runs on application shutdown

    }

    void Application_Error(object sender, EventArgs e)
    {
        // Code that runs when an unhandled error occurs

    }      

</script>
