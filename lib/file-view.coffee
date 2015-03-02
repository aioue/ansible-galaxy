{$, View, TextEditorView} = require 'atom-space-pen-views'

module.exports =
class FileView extends View
  @content: ->
    @div class: 'advanced-new-file overlay from-top', =>
      @p outlet:'message',
        class:'icon icon-file-add',
        "Enter the path for the new ansible galaxy."
      @subview 'miniEditor', new TextEditorView({mini:true})
      @ul class: 'list-group', outlet: 'directoryList'

  initialize: (serializeState) ->
    atom.commands.add 'atom-workspace', 'advanced-new-file:toggle', => @toggle()
    @miniEditor.getModel().setPlaceholderText(path.join('path','to','directory'))
    @on 'core:confirm', => @confirm()
    @on 'core:cancel', => @detach()

  confirm: ->
    console.log "confirmed with" + @miniEditor.getText()
    @detach()

  detach: ->
    return unless @hasParent()
    @detaching = true
    @miniEditor.setText ''
    miniEditorFocused = @miniEditor.isFocused
    super
    @panel?.hide()
    @restoreFocus() if miniEditorFocused
    @detaching = false
