\name{vkGetGroupStatPostReach}
\alias{vkGetGroupStatPostReach}
\title{Statistics of Posts on The Community Wall.}
\description{Returns statistics for writing to the wall.}
\usage{
vkGetGroupStatPostReach(owner_id = NULL, 
                        post_ids = NULL, 
                        api_version = NULL, 
                        access_token = NULL)
}
\arguments{
  \item{owner_id}{community ID - the owner of the entry. Indicated with a minus sign.}
  \item{post_ids}{vector containing record identifiers, please note - statistics data are available only for the 300 latest (most recent) posts on the community wall.}
  \item{api_version}{An optional argument, the API version number to which the request will be executed.}
  \item{access_token}{API access tokens obtained using vkAuth or vkGetToken functions.}
}
\value{Date frame with the following values:
\item{1. reach_viral}{viral coverage (if recording was promoted with targeted advertising)}
\item{2. reach_ads}{advertising reach (if the record was promoted using targeted advertising).}
\item{3. reach_subscribers}{reach subscribers.}
\item{4. reach_total}{total coverage.}
\item{5. links}{follow the link.}
\item{6. to_group}{transitions to the community.}
\item{7. join_group}{entry into the community.}
\item{8. report}{number of complaints about the record.}
\item{9. hide}{number of entries hiding.}
\item{10. unsubscribe}{number of unsubscribe members.}
\item{11. post_id}{post id.}
}
\details{
Statistics records are currently available only to communities with the number of participants from 5000 and above, as well as official communities.

Please note - statistics data are available only for the latest 300 (most recent) posts on the community wall.
Common errors may occur during execution. Their description is on a separate page - https://vk.com/dev/errors.
}
\author{
Alexey Seleznev
}
\examples{
\dontrun{
## auth
my_tok <- vkAuth(app_id = 1, 
                 app_secret = "H2Pk8htyFD8024mZaPHm")

## Get the list of community messages
my_vk_wall  <- vkGetUserWall(user_id = -111111,
                             access_token = my_tok$access_token) 
							 
## Get sub-stats for the latest 300 community entries						 
post_reach <- vkGetGroupStatPostReach(owner_id = -2222222,
                                      post_ids = my_vk_wall$id,
                                      access_token = my_tok$access_token)
}
}
