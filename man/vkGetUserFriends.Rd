\name{vkGetUserFriends}
\alias{vkGetUserFriends}
\title{Frend List in 'Vkontakte'}
\description{Returns a list of user friends identifiers and extended information about the user's friends.}
\usage{
vkGetUserFriends(
      user_id      = NULL,
      name_case    = "nom",
      username     = getOption("rvkstat.username"),
      api_version  = getOption("rvkstat.api_version"),
      token_path   = vkTokenPath(),
      access_token = getOption("rvkstat.access_token")
)
}
\arguments{
  \item{user_id}{user ID for which you want to get a list of friends. If the parameter is not specified, it is considered that it is equal to the identifier of the current user.}
  \item{name_case}{case for declining the user's first and last name. Possible values: nominative - nom, genitive - gen, dative - dat, accusative - acc, ablative - ins, prepositional - abl. Default nom.}
  \item{username}{Your vkontakte login.}
  \item{api_version}{Vkontakte API version.}
  \item{token_path}{Path to dir with credentials}
  \item{access_token}{API access tokens obtained using vkAuth or vkGetToken functions}
}
\value{Date frame with community statistics with the following values:
  \item{1. user_id}{user id.}
  \item{2. first_name}{name.}
  \item{3. last_name}{last name}
  \item{4. gender}{sex.}
  \item{5. nickname}{nickname of the user.}
  \item{6. domain}{short page address. Returns a string containing the short address of the page (for example, andrew). If not assigned, it returns "id" + user_id, for example, id35828305.}
  \item{7. bdate}{date of birth. Returns in the format D.M.YYYY or D.M (if the year of birth is hidden). If the date of birth is hidden entirely, the field is absent in the answer.}
  \item{8. city}{city id, city name can be obtained using the function vkGetDbCities.}
  \item{9. country}{country id, country name can be obtained using the function vkGetDbCountries.}
  \item{10. photo_50}{url of a square photo of a user having a width of 50 pixels. If the user does not have a photo, he returns http://vk.com/images/camera_c.gif.}
  \item{11. photo_100}{url of a square photo of a user having a width of 100 pixels. If the user doesn’t have a photo, he returns http://vk.com/images/camera_b.gif.}
  \item{12. photo_200_orig}{url of a user photo that has a width of 200 pixels. If the user doesn’t have a photo, he returns http://vk.com/images/camera_a.gif.}
  \item{13. has_mobile}{information about whether the user's mobile phone number is known. Return values: 1 - known, 0 - unknown.}
  \item{14. online}{information about whether the user is currently online.}
  \item{15. can_post}{information about whether the current user can post on the wall. Possible values: 1 - can, 0 - can not.}
  \item{16. can_see_all_posts}{information about whether the current user can see someone else's posts on the wall. Possible values: 1 - can, 0 - can not.}
  \item{17. can_write_private_message}{information about whether the current user can send a private message. Possible values: 1 - can, 0 - can not.}
  \item{18. status}{user status. Returns a string containing the text of the status located in the profile under the user name.}
  \item{19. last_seen_time}{date and time of last visit.}
  \item{20. last_seen_platform}{the type of platform through which the last entry was made. Possible values: 1 - mobile version, 2 - application for iPhone, 3 - application for iPad, 4 - application for Android, 5 - application for Windows Phone, 6 - application for Windows 10, 7 - full version of the site.}
  \item{21. university}{university id.}
  \item{22. university_name}{university name.}
  \item{23. faculty}{faculty id.}
  \item{24. faculty_name}{faculty name.}
  \item{25. graduation}{graduation year.}
  \item{26. education_form}{learning form}
  \item{27. education_status}{status (for example, "Graduate (Specialist)")}
  \item{28. relation}{marital status of the user. Possible values: 1 - not married / not married, 2 - have a friend / have a girlfriend, 3 - engaged / engaged, 4 - married / married, 5 - everything is difficult, 6 - in active search, 7 - in love / in love, 8 - in a civil marriage, 0 - not specified.}
}
\author{
Alexey Seleznev
}
\references{
Documentation for API method friends.get: https://vk.com/dev/friends.get
}
\examples{
\dontrun{
## user list
my_vk_friends <- vkGetUserFriends(user_id = 7437995)
}
}
