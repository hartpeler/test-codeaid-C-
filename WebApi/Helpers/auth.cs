using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.Mvc.Filters;

public class BearerTokenAuthorizationFilter : IAuthorizationFilter
{
    private readonly string expectedBearerToken;

    public BearerTokenAuthorizationFilter(string expectedBearerToken)
    {
        this.expectedBearerToken = expectedBearerToken;
    }

    public void OnAuthorization(AuthorizationFilterContext context)
    {
        // Get the Bearer token from the request's Authorization header
        string authorizationHeader = context.HttpContext.Request.Headers["Authorization"];
        if (!string.IsNullOrEmpty(authorizationHeader) && authorizationHeader.StartsWith("Bearer "))
        {
            // Extract the Bearer token
            string providedBearerToken = authorizationHeader.Substring("Bearer ".Length).Trim();

            // Check if the provided token matches the expected token
            if (providedBearerToken != expectedBearerToken)
            {
                // Token doesn't match, return a 401 Unauthorized response
                context.Result = new UnauthorizedResult();
            }
        }
        else
        {
            // Authorization header is missing or doesn't start with "Bearer ", return a 401 Unauthorized response
            context.Result = new UnauthorizedResult();
        }
    }
}
