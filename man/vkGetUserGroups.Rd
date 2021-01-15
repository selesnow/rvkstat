\name{vkGetUserGroups}
\alias{vkGetUserGroups}
\title{List of 'Vkontakte' communities.}
\description{Returns the list of communities for the specified user.}
\usage{
vkGetUserGroups(
    user_id = NULL,
    filter = NULL,
    username     = getOption("rvkstat.username"),
    api_version  = getOption("rvkstat.api_version"),
    token_path   = vkTokenPath(),
    access_token = getOption("rvkstat.access_token")
)
}
\arguments{
  \item{user_id}{user ID for which you want to get a list of friends. If the parameter is not specified, it is considered that it is equal to the identifier of the current user.}
  \item{filter}{A list of community filters to be returned, separated by commas. The values are admin, editor, moder, groups, publics, events. By default, all user communities are returned. If the admin filter is specified, the communities in which the user is an administrator, editor - administrator or editor, moder - administrator, editor or moderator will be returned.}
  \item{username}{Your vkontakte login.}
  \item{api_version}{Vkontakte API version.}
  \item{token_path}{Path to dir with credentials}
  \item{access_token}{API access tokens obtained using vkAuth or vkGetToken functions}
}
\value{Date frame with community statistics with the following values:
  \item{gid}{community id.}
  \item{name}{community name.}
  \item{screen_name}{short address, for example, apiclub.}
  \item{is_closed}{is the community closed. Possible values: 0 - open, 1 - closed, 2 - private}
  \item{type}{community type: group - group, page - public page, event - event.}
  \item{description}{community description text.}
  \item{wiki_page}{name of the main wiki page.}
  \item{members_count}{number of members.}
  \item{start_date}{date of foundation.}
  \item{can_post}{information about whether the current user can post on the community wall. Possible values: 1 - can, 0 - can not.}
  \item{can_see_all_posts}{information about whether it is allowed to see other people's posts on the group wall. Possible values: 1 - can, 0 - can not.}
  \item{activity}{public page status bar. For groups, a string value is returned, whether the group is open or not, and for events the start date.}
  \item{status}{community status.}
  \item{fixed_post}{pinned post ID.}
  \item{verified}{information about whether the community is verified. Possible values: 1 - can, 0 - can not.}
  \item{site}{the address of the site from the "web site" field in the community description.}
  \item{can_create_topic}{information on whether the current user can create a new discussion in the group. Possible values: 1 - can, 0 - can not.}
  \item{photo}{URL of the main photo with a size of 50x50px.}
  \item{photo_medium}{URL of the main photo with a size of 100x100px.}
  \item{photo_big}{The URL of the main photo in the maximum size.}
}
\author{
Alexey Seleznev
}
\references{
Documentation for API method groups.get: https://vk.com/dev/groups.get
}
\examples{
\dontrun{
## auth
my_tok <- vkAuth(app_id = 1, app_secret = "H2Pk8htyFD8024mZaPHm")

## get groups
my_vk_community <- vkGetUserGroups(user_id = 7437995,
                                   access_token = my_tok$access_token)

}
}
