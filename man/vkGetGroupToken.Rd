\name{vkGetGroupToken}
\alias{vkGetGroupToken}
\title{Get the Access Key of Community 'Vkontakte'.}
\description{This key allows you to work with the API on behalf of a group, meeting or public page. For example, with its help you can respond to community subscribers to messages received in its address.
With the community access key, you can call those methods that have a special mark in the general list (https://vk.com/dev/methods).
The vkGetGroupToken function gets the community access key using the Implicit flow scheme (https://vk.com/dev/implicit_flow_group).}
\usage{
vkGetGroupToken(
    app_id = getOption("rvkstat.app_id"), 
    group_ids = NULL
)
}
\arguments{
  \item{app_id}{The ID of your Vkontakte application, which is located in the "Application ID" field in the application settings.}
  \item{group_ids}{A vector containing the ID of the groups to which you want to get an access code.}
}
\value{Object containing a group access token}
\author{Alexey Seleznev}
\examples{
\dontrun{
## Get vk api token, where 1 is the application ID, 
## and 11,22,33 is the group ID.
myToken <- vkGetGroupToken(appId = 1, 
                           group_ids = c(11,22,33))
}
}
