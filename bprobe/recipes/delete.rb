#
# Author:: Joe Williams (<j@boundary.com>)
# Cookbook Name:: bprobe
# Recipe:: delete
#
# Copyright 2011, Boundary
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

# delete the cert and key files on disk
bprobe_certificates node[:fqdn] do
  action :delete
end

# delete the meter from the boundary api
bprobe node[:fqdn] do
  action :delete
end

service "bprobe" do
  action [ :stop, :disable ]
end

package "bprobe" do
  action :remove
end

bprobe_annotation "bprobe removal" do
  action :create
  subtype node[:fqdn]
end

bprobe_annotation "bprobe removal" do
  action :create_opsworks
end