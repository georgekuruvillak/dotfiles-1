runtime syntax/groovy.vim

syn keyword jenkinsFileStep archiveArtifacts
syn keyword jenkinsFileStep bat
syn keyword jenkinsFileStep build
syn keyword jenkinsFileStep checkout
syn keyword jenkinsFileStep cleanWs
syn keyword jenkinsFileStep containerLog
syn keyword jenkinsFileStep deleteDir
syn keyword jenkinsFileStep dir
syn keyword jenkinsFileStep echo
syn keyword jenkinsFileStep emailext
syn keyword jenkinsFileStep emailextrecipients
syn keyword jenkinsFileStep error
syn keyword jenkinsFileStep fileExists
syn keyword jenkinsFileStep fingerprint
syn keyword jenkinsFileStep git
syn keyword jenkinsFileStep input
syn keyword jenkinsFileStep isUnix
syn keyword jenkinsFileStep junit
syn keyword jenkinsFileStep library
syn keyword jenkinsFileStep libraryResource
syn keyword jenkinsFileStep load
syn keyword jenkinsFileStep mail
syn keyword jenkinsFileStep milestone
syn keyword jenkinsFileStep node
syn keyword jenkinsFileStep parallel
syn keyword jenkinsFileStep powershell
syn keyword jenkinsFileStep properties
syn keyword jenkinsFileStep pwd
syn keyword jenkinsFileStep readFile
syn keyword jenkinsFileStep readTrusted
syn keyword jenkinsFileStep resolveScm
syn keyword jenkinsFileStep retry
syn keyword jenkinsFileStep script
syn keyword jenkinsFileStep sh
syn keyword jenkinsFileStep sleep
syn keyword jenkinsFileStep stage
syn keyword jenkinsFileStep stash
syn keyword jenkinsFileStep step
syn keyword jenkinsFileStep svn
syn keyword jenkinsFileStep timeout
syn keyword jenkinsFileStep timestamps
syn keyword jenkinsFileStep tm
syn keyword jenkinsFileStep tool
syn keyword jenkinsFileStep unstash
syn keyword jenkinsFileStep validateDeclarativePipeline
syn keyword jenkinsFileStep waitUntil
syn keyword jenkinsFileStep withAnt
syn keyword jenkinsFileStep withCredentials
syn keyword jenkinsFileStep withEnv
syn keyword jenkinsFileStep wrap
syn keyword jenkinsFileStep writeFile
syn keyword jenkinsFileStep ws
syn keyword jenkinsFileStep archive
syn keyword jenkinsFileStep catchError
syn keyword jenkinsFileStep container
syn keyword jenkinsFileStep dockerFingerprintFrom
syn keyword jenkinsFileStep dockerFingerprintRun
syn keyword jenkinsFileStep envVarsForTool
syn keyword jenkinsFileStep getContext
syn keyword jenkinsFileStep podTemplate
syn keyword jenkinsFileStep unarchive
syn keyword jenkinsFileStep withContext
syn keyword jenkinsFileStep withDockerContainer
syn keyword jenkinsFileStep withDockerRegistry
syn keyword jenkinsFileStep withDockerServer

hi link jenkinsFileStep Function

let b:current_syntax = "Jenkinsfile"

