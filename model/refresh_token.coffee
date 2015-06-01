module.exports =
  class RefreshToken

    constructor: (userId, token, createdDate, expiryDate) ->
      @userId = userId
      @token = token;
      @createdDate = createdDate
      @expiryDate = expiryDate

    getUserId = ->
      return @userId

    getToke = ->
      return @token

    getCreatedDate = ->
      return @createdDate

    getExpiryDate = ->
      return @expiryDate