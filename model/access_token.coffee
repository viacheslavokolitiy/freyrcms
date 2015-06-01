module.exports =
  class AccessToken

    constructor: (userId, createdDate, token, expiryDate) ->
      @userID = userId
      @createdDate = createdDate
      @token = token
      @expiryDate = expiryDate

    getUserId = ->
      return @userID

    getCreatedDate = ->
      return @createdDate

    getToken = ->
      return @token

    getExpiryDate = ->
      return @expiryDate