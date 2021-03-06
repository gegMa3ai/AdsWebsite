﻿using System.Web;
using System.Web.Mvc;
using System.Web.Routing;

namespace AW.Business.Authorization
{
    public class EditorAttribute : AuthorizeAttribute
    {
        public override void OnAuthorization(AuthorizationContext filterContext)
        {
            var user = HttpContext.Current.User as UserPrincipal;

            if (user == null || !(user.IsInRole("Admin") || user.IsInRole("Editor")))
                filterContext.Result = new RedirectToRouteResult(new RouteValueDictionary(new { controller = "Access", action = "Denied", area = "" }));
        }
    }
}

