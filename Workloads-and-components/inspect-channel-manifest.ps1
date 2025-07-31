#
# Idea from
#    https://gist.github.com/mmozeiko/7f3162ec2988e81e56d5c4e22cde9977
#
#
# VS 17 = Visual Studio 2022
#
# invoke-webrequest https://aka.ms/vs/17/release/channel -outFile VisualStudio.17.Release.chman
  invoke-webrequest https://aka.ms/vs/17/pre/channel     -outFile VisualStudio.17.Preview.chman


cat VisualStudio.17.Release.chman | jq keys
#
# [
#   "channelItems",
#   "info",
#   "manifestVersion",
#   "signature"
# ]
#

cat VisualStudio.17.Release.chman | jq  .info
#   {
#     "id": "VisualStudio.17.Release/17.14.10+36327.8",
#     "buildBranch": "d17.14",
#     "buildVersion": "17.14.36327.8",
#     "commitId": "9c44947270e1855daef3c04c366aea2e90d9b7e8",
#     "communityOrLowerFlightId": "eafa266867f74eb",
#     "localBuild": "build-lab",
#     "manifestName": "VisualStudio.17.Release",
#     "manifestType": "channel",
#     "productDisplayVersion": "17.14.10",
#     "productLine": "Dev17",
#     "productLineVersion": "2022",
#     "productMilestone": "RTW",
#     "productMilestoneIsPreRelease": "False",
#     "productName": "Visual Studio",
#     "productPatchVersion": "10",
#     "productPreReleaseMilestoneSuffix": "1.0",
#     "productSemanticVersion": "17.14.10+36327.8",
#     "professionalOrGreaterFlightId": "4bfa166bd6094b0",
#     "qBuildSessionId": "8f5f40fc-b90a-ea8e-46c5-2c40390680d0"
#   }


cat VisualStudio.17.Release.chman | jq  .channelItems[].id
#
#  "Microsoft.VisualStudio.Manifests.VisualStudio"
#  "Microsoft.VisualStudio.Product.BuildTools"
#  "Microsoft.VisualStudio.Product.Community"
#  "Microsoft.VisualStudio.Product.Community"
#  "Microsoft.VisualStudio.Product.Enterprise"
#  "Microsoft.VisualStudio.Product.Enterprise"
#  "Microsoft.VisualStudio.Product.Professional"
#  "Microsoft.VisualStudio.Product.Professional"
#  "Microsoft.VisualStudio.Product.TeamExplorer"
#  "Microsoft.VisualStudio.Product.TestAgent"
#  "Microsoft.VisualStudio.Product.TestController"
#  "VisualStudio.17.Release"
#  "VisualStudio.17.Release.Bootstrappers.Setup"
#

$vsPayloadUrl = $(cat VisualStudio.17.Release.chman | jq -r '.channelItems[]  | select(.id == ""Microsoft.VisualStudio.Manifests.VisualStudio""        ).payloads[0].url')
write-host $vsPayloadUrl



# $vsPayload = (invoke-webrequest $vsPayloadUrl).content
# write-host $vsPayload
$progressPreference = 'SilentlyContinue'
                invoke-webRequest $vsPayloadUrl -outFile VisualStudio.vsman

# cat VisualStudio.vsman | jq .packages
  cat VisualStudio.vsman | jq .packages[].id

$vs = get-content VisualStudio.vsman  -raw | convertFrom-json

$packages = @{}

foreach ($package in $vs.packages) {
   if (-not $packages.ContainsKey($package.id)) {
       $packages[$package.id] = @()
   }
   $packages[$package.id] += $package
}

foreach ($p in $packages.keys) {
   write-host "$p - $($packages[$p].length)"
}



return

#  Alternatively, if using preview url:
# cat VisualStudio.17.Release.chman | jq -r '.channelItems[]  | select(.id == ""Microsoft.VisualStudio.Manifests.VisualStudioPreview"" ).payloads[0].url'

cat VisualStudio.17.Release.chman | jq  '.channelItems[]  | select(.id == ""Microsoft.VisualStudio.Product.Community"" and .productArch == ""x64"" )'
