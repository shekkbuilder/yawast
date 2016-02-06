require 'minitest/autorun'
require 'webrick'
require './lib/yawast'
require './test/base'

class TestScannerApacheServerStatus < Minitest::Test
  include TestBase

  def test_server_status_present
    server = start_web_server 'test/data/apache_server_status.txt', 'server-status'

    override_stdout
    uri = Yawast::Commands::Utils.extract_uri(['http://localhost:1234'])
    Yawast::Scanner::Apache.check_server_status uri

    assert stdout_value.include?('Apache Server Status page found'), 'Apache Server Status page warning not found'

    server.exit
    restore_stdout
  end
end
