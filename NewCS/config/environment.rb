LDAP_SERVER = "192.168.56.101"
LDAP_ROOT = "cn=root, o=newcs, dc=ua"
LDAP_ROOT_PASSWORD = "qwerty"

LDAP_ADMIN_BASE = "ou=admins, o=newcs, dc=ua"
LDAP_MODERATOR_BASE = "ou=moderators, o=newcs, dc=ua"
LDAP_PREPOD_BASE = "ou=prepods, o=newcs, dc=ua"
LDAP_STUDENT_BASE = "ou=users, o=newcs, dc=ua"

ROLE_ADMIN = "0"
ROLE_MODERATOR = "1"
ROLE_PREPOD = "2"
ROLE_STUDENT = "3"




# Load the rails application
require File.expand_path('../application', __FILE__)

# Initialize the rails application
NewCS::Application.initialize!


 