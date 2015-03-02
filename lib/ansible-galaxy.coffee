module.exports =
  activate: ->
    atom.workspaceView.command "ansible-galaxy:init", => @init()

  @content: (params)->
    @div class: 'ansible-galaxy overlay from-top', =>
      @p outlet:'message', class:'icon icon-file-add', "Enter the path for the new role."
      @subview 'miniEditor', new EditorView({mini:true})
      @ul class: 'list-group', outlet: 'directoryList'

  init: ->
    selectedPath = undefined
    console.log "ansible-galaxy INIT"
    atom.packages.activatePackage('tree-view')
    .then (treeViewPackage) ->
      treeView = treeViewPackage.mainModule
      selectedPath = treeView.treeView.selectedPath
      console.log "selectedPath = " + selectedPath

      exec = require('child_process').exec;
      child = undefined

      child = exec("ls -la",
            cwd: selectedPath
          , (error, stdout, stderr) ->
            console.log "stdout: " + stdout
            console.log "stderr: " + stderr
            console.log "exec error: " + error  if error isnt null
            return
      )
