module.exports =
  activate: ->
    atom.workspaceView.command "ansible-galaxy:init", => @init()

  init: ->
    console.log "ansible-galaxy INIT"
    atom.packages.activatePackage('tree-view')
    .then (treeViewPackage) ->
       treeView = treeViewPackage.mainModule
       console.log "selectedPath = " + treeView.treeView.selectedPath

    # exec = require('child_process').exec;
    #
    # child = undefined
    #
    # child = exec("ls -la",
    #       cwd: "/Users/tpai/Desktop"
    #     , (error, stdout, stderr) ->
    #       console.log "stdout: " + stdout
    #       console.log "stderr: " + stderr
    #       console.log "exec error: " + error  if error isnt null
    #       return
    # )

    console.log("foo")
