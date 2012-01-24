#   Copyright (c) 2010-2011, Diaspora Inc.  This file is
#   licensed under the Affero General Public License version 3 or later.  See
#   the COPYRIGHT file.

# This file is used by Rack-based servers to start the application.

require ::File.expand_path('../config/environment',  __FILE__)
require ::File.expand_path('../config/unicorn_killer',  __FILE__)
require ::File.expand_path('../config/rack/chrome_frame',  __FILE__)

# use UnicornKiller::MaxRequests, 1000
use UnicornKiller::Oom, 400 * 1024 #kill a unicorn that has gone over 400mB

use Rack::ChromeFrame, :minimum => 8
run Diaspora::Application
