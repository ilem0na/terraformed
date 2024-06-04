variable "usernames" {
  description = "create IAM users with these names"
  type = list(string)
  default = [ "mbappe", "vinicius", "rodrygo" ]
}