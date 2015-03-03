GalaxyDialog = null  # Defer requiring until actually needed

module.exports =
  activate: ->
    console.log "ansible-galaxy activated"
    atom.commands.add 'atom-workspace',
      'ansible-galaxy:galaxize',
      => @galaxize()

  galaxize: ->
    atom
      .packages
      .activatePackage('tree-view')
      .then (treeViewPackage) ->
        treeView = treeViewPackage.mainModule.treeView
        selectedPath = treeView.selectedPath

        GalaxyDialog ?= require './galaxy-dialog'
        dialog = new GalaxyDialog(selectedPath)

        dialog.on 'directory-chosen', (event, chosenPath) ->
          console.log "directory chosen", chosenPath
          # Do your stuff here.
          false

        dialog.attach()


