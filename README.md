# OpenSecrets

## Description
A Ruby wrapper around the OpenSecrets.org API.

You will need to have an OpenSecrets.org API key before you can use this library.

See the [OpenSecrets API documentation](https://www.opensecrets.org/resources/create/api_doc.php).

This project was inspired by a project suggestion on the SunlightLabs.com website.  If you would
like to contribute or learn more please see [https://sunlightfoundation.com/](https://sunlightfoundation.com/)

## Installation

    gem install opensecrets

## Usage

See `examples/example.rb` for more complete examples.

    require 'rubygems'
    require 'opensecrets'
    require 'pp'

    # Note, you can also provide your API key in an environment variable for security and convenience.
    #   export OPENSECRETS_API_KEY=YOUR_API_KEY
    # If you provide your key this way you do not have to provide a key in the OpenSecrets::*.new constructors.
    # A key provided to the constructor overrides any environment variable that is set.

    member = OpenSecrets::Member.new('YOUR OPEN SECRETS API KEY')
    pp member.pfd({:cid => 'N00007360', :year => '2008'})["response"]

    cand = OpenSecrets::Candidate.new('YOUR OPEN SECRETS API KEY')
    pp cand.summary({:cid => 'N00007360'})["response"]

    com = OpenSecrets::Committee.new('YOUR OPEN SECRETS API KEY')
    pp com.by_industry({:cmte => 'HARM', :congno => '110', :indus => 'F10'})["response"]

## Bug Reporting & Pull Requests

[https://github.com/grempe/opensecrets/issues](https://github.com/grempe/opensecrets/issues)

## Legal

### Copyright

(c) 2009-2015 Glenn Rempe

### License

Licensed under the MIT License;
you may not use this file except in compliance with the License.
You may obtain a copy of the License at

[http://opensource.org/licenses/MIT](http://opensource.org/licenses/MIT)

### Warranty

Unless required by applicable law or agreed to in writing,
software distributed under the License is distributed on an
"AS IS" BASIS, WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND,
either express or implied. See the LICENSE file for the
specific language governing permissions and limitations under
the License.

## Authors

***Glenn Rempe***</br>
<glenn@rempe.us></br>
<http://www.rempe.us></br>
@grempe on Twitter</br>
