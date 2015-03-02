FileView = require('./file-view')

module.exports =
  activate: ->
    console.log "ansible-galaxy activated"
    atom.commands.add 'atom-workspace',
      'ansible-galaxy:galaxize',
      => @galaxize()

  galaxize: ->
    f = new FileView()
    console.log f
    atom.workspace.addTopPanel(item: f)

    # Disable this for a moment.
    if false
      atom
        .packages
        .activatePackage('tree-view')
        .then (treeViewPackage) ->
          treeView = treeViewPackage.mainModule.treeView
          console.log "selectedPath = " + treeView.selectedPath

          exec = require('child_process').exec

          child = exec(
            "ls -la",
            {},
            (error, stdout, stderr) ->
              console.log 'execution completed'
              console.log "stdout: " + stdout
              console.log "stderr: " + stderr
              console.log "exec error: " + error  if error isnt null
              return
          )
