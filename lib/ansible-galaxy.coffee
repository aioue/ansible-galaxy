module.exports =
  activate: ->
    atom.workspaceView.command "ansible-galaxy:init", => @init()

  init: ->
    selection = atom.workspace.getActiveEditor().getSelection()

    selection.insertText("\n" + "foo" + "\n")

    exec = require('child_process').exec;

    child = undefined

    child = exec("ls -la",
          cwd: "/Users/tpai/Desktop"
        , (error, stdout, stderr) ->
          console.log "stdout: " + stdout
          console.log "stderr: " + stderr
          console.log "exec error: " + error  if error isnt null
          return
    )

    console.log("foo")
    console.log(@selectedEntry().getPath())
foo
