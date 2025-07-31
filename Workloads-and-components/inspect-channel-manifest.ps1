#
# VS 17 = Visual Studio 2022
#
invoke-webrequest https://aka.ms/vs/17/release/channel -outFile VisualStudio.17.Release.chman

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

cat VisualStudio.17.Release.chman | jq  '.channelItems[]  | select(.id == ""Microsoft.VisualStudio.Product.Community"" and .productArch == ""x64"" )'
