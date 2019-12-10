\name{vkGetUserDialogs}
\alias{vkGetUserDialogs}
\title{Returns The List of Conversations of The Current User or Community.}
\description{Return a list of dialogs, or rather the last message from each dialog, in order to get a list of message dialogs, you must pass the community access key received by using the vkGetGroupToken function to the access_token argument, in order to get a list of user dialogs access obtained with vkGetToken}
\usage{
vkGetUserDialogs(offset = NULL, count = NULL, 
                 start_message_id = NULL, 
                 preview_length = 0, unread = 0, 
                 important = 0, unanswered =  0, 
                 api_version = NULL, access_token = NULL)
}
\arguments{
  \item{offset}{Integer, offset required to select a specific subset of dialogs.}
  \item{count}{A positive number, the default is 20, the maximum value is 200, the number of conversations you need to receive.}
  \item{start_message_id}{A positive number, a message identifier starting from which you want to return a list of conversations. See below for details.}
  \item{preview_length}{A positive number, the number of characters to cut the message. Specify 0 if you do not want to cut the message. (by default, messages are not cropped). Please note that the text is cut off by words, the exact number of characters may not match the specified value.}
  \item{unread}{1 - return only dialogs with unread incoming messages. Default: 0.}
  \item{important}{1 - return dialogs marked “Important” (for community posts).}
  \item{unanswered}{1 - return dialogs marked “Unanswered” (for community messages).}
  \item{api_version}{API access token, obtained using vkAuth or vkGetToken}
  \item{access_token}{API access token, obtained using the functions vkAuth or vkGetToken}
}
\details{
If the start_message_id parameter was passed, the position of the dialog in the list will be found, the last message identifier of which is equal to start_message_id (or the closest one to it). Starting from this position, count dialogs will be returned. The offset in this case will be counted from this position (it may be negative).

API method which is used in the function: messages.getDialogs (https://vk.com/dev/messages.getDialogs)

The messages.getDialogs method returns a collection of objects describing private messages. A list of all possible fields for describing personal messages can be found at the link - https://vk.com/dev/objects/message.
}
\value{Date frame with the following values:
\item{1. id}{message identifier (not returned for forwarded messages).}
\item{2. date}{date the message was sent.}
\item{3. out}{message type (0 - received, 1 - sent, not returned for forwarded messages).}
\item{4. user_id}{identifier of the user in the dialogue with which the message is located.}
\item{5. read_state}{status of the message (0 - not read, 1 - read, not returned for forwarding messages).}
\item{6. title}{the title of the message or conversation.}
\item{7. body}{message text.}
\item{8. random_id}{identifier used when sending a message. Returned for outgoing messages only}
}
\author{
Alexey Seleznev
}

\examples{
\dontrun{
# Get access key for the community
group_token <- vkGetGroupToken(app_id = 111111, 
                               group_ids = 222222)

# Get dialogs list
message <- vkGetUserDialogs(access_token = group_token)
}
}

