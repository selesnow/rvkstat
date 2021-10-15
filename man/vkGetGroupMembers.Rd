\name{vkGetGroupMembers}
\alias{vkGetGroupMembers}
\title{Returns a list of community members.}
\description{Returns a list of community members.}
\usage{
vkGetGroupMembers(
    group_id     = NULL,
    sort         = c('time_desc', 'time_asc', 'id_desc', 'id_asc'),
    fields       = c('sex', 'bdate', 'city', 'country', 'photo_50', 'photo_100', 
                     'photo_200_orig', 'photo_200', 'photo_400_orig', 'photo_max', 
                     'photo_max_orig', 'online', 'online_mobile', 'lists', 'domain', 
                     'has_mobile', 'contacts', 'connections', 'site', 'education', 
                     'universities', 'schools', 'can_post', 'can_see_all_posts', 
                     'can_see_audio', 'can_write_private_message', 'status', 
                     'last_seen', 'common_count', 'relation', 'relatives'),
    filter       = c('all', 'friends', 'unsure', 'managers', 'donut'),
    username     = getOption("rvkstat.username"),
    api_version  = getOption("rvkstat.api_version"),
    token_path   = vkTokenPath(),
    access_token = getOption("rvkstat.access_token")
)
}
\arguments{
  \item{group_id}{Community ID or short name.}
  \item{sort}{sort with which to return the list of participants. Possible values: time_desc, time_asc, id_desc, id_asc.}
  \item{fields}{List of additional fields to return. Possible values: sex, bdate, city, country, photo_50, photo_100, photo_200_orig, photo_200, photo_400_orig, photo_max, photo_max_orig, online, online_mobile, lists, domain, has_mobile, contacts, connections, site, education, universities, schools, can_post, can_see_all_posts, can_see_audio, can_write_private_message, status, last_seen, common_count, relation, relatives}
  \item{filter}{Group member filter. Possible values: all, friends, unsure, managers, donut}
  \item{username}{Your vkontakte login.}
  \item{api_version}{Vkontakte API version.}
  \item{token_path}{Path to dir with credentials}
  \item{access_token}{API access tokens obtained using vkAuth or vkGetToken functions}
}
\value{Date frame with community statistics with the following values}
\author{
Alexey Seleznev
}
\references{
Documentation for API method stats.get: https://vk.com/dev/groups.getMembers
}
\examples{
\dontrun{
## Getting community members
communityMembers <- vkGetGroupStat(
    group_id = "data_club")
}
}
