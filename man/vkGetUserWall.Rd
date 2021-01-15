\name{vkGetUserWall}
\alias{vkGetUserWall}
\title{Get Posts From Userwall.}
\description{Return posts list from userwall 'Vkontakte'.}
\usage{
vkGetUserWall(
  user_id      = NULL,
  domain       = NULL,
  filter       = NULL,
  username     = getOption("rvkstat.username"),
	api_version  = getOption("rvkstat.api_version"),
  token_path   = vkTokenPath(),
  access_token = getOption("rvkstat.access_token")
)
}
\arguments{
  \item{user_id}{user ID for which you want to get a list of friends. If the parameter is not specified, it is considered that it is equal to the identifier of the current user.}
  \item{domain}{short address of user or community.}
  \item{filter}{determines what types of posts on the wall should be received. Possible values: suggests — suggested entries on the community wall, postponed — deferred entries, owner — owner wall entries, others — not wall owner entries, all — all entries on the wall (owner + others), Default: all. }
  \item{username}{Your vkontakte login.}
  \item{api_version}{Vkontakte API version.}
  \item{token_path}{Path to dir with credentials}
  \item{access_token}{API access tokens obtained using vkAuth or vkGetToken functions}
}
\value{Date frame with the following values:
  \item{1. id}{record ID.}
  \item{2. from_id}{identifier of the post author.}
  \item{3. to_id}{identifier of the owner of the wall on which the entry is placed.}
  \item{4. date}{post publication time}
  \item{5. post_type}{record type, can be one of the following values: post, copy, reply, postpone, suggest.}
  \item{6. text}{text entry.}
  \item{7. can_delete}{information about whether the current user can delete a post (1 — maybe, 0 — cannot).}
  \item{8. comments_count}{number of comments.}
  \item{9. likes_count}{the number of users who liked the post.}
  \item{10. reposts_count}{number of users who copied the record.}
  \item{11. attachment_type}{type of media attachment of the record (photos, links, etc.)}
}
\author{
Alexey Seleznev
}
\references{
Documentation for API method wall.get: https://vk.com/dev/wall.get
}
\examples{
\dontrun{
## auth
my_tok <- vkAuth(app_id = 1, app_secret = "H2Pk8htyFD8024mZaPHm")

## get posts
my_vk_wall <- vkGetUserWall(user_id = 7437995,
                            access_token = my_tok$access_token)

}
}
