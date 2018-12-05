"""
Configuration example for ``ptpython``.
Adapted from:
    https://github.com/jonathanslenders/ptpython/blob/master/examples/ptpython_config/config.py
Copy this file to ~/.ptpython/config.py
"""
from __future__ import unicode_literals
from prompt_toolkit.filters import ViInsertMode
from prompt_toolkit.key_binding.key_processor import KeyPress
from prompt_toolkit.keys import Keys

__all__ = (
    'configure',
)

# Custom colorscheme for the UI. See `ptpython/layout.py` and
# `ptpython/style.py` for all possible tokens.
_custom_ui_colorscheme = {
}


def configure(repl):
    """
    Configuration method. This is called during the start-up of ptpython.

    :param repl: `PythonRepl` instance.
    """
    # Vi mode.
    repl.vi_mode = True

    # '>>>' or 'In [1]'
    repl.prompt_style = 'ipython'  # 'classic' or 'ipython'

    # tooltext like, coloured signature popup
    repl.show_signature = False

    # box at the bottom with signature and docstring
    repl.show_docstring = True

    repl.insert_blank_line_after_output = False

    repl.enable_mouse_support = True

    repl.highlight_matching_parenthesis = True

    # Don't require tab before the completion menu is shown.
    # draws over repl.show_signature
    repl.complete_while_typing = False

    # History Search.
    # When True, going back in history will filter the history on the records
    # starting with the current input. (Like readline.)
    # Note: When enable, please disable the `complete_while_typing` option.
    #       otherwise, when there is a completion available, the arrows will
    #       browse through the available completions instead of the history.
    repl.enable_history_search = False

    # Use this colorscheme for the code.
    # TODO write own colorscheme, possibly including bold/italics ('algol_nu')
    repl.use_code_colorscheme('default')

    # Enable 24bit True color. (Not all terminals support this. -- maybe check
    # $TERM before changing.)
    repl.true_color = True

    # Install custom colorscheme named 'my-colorscheme' and use it.
    repl.install_ui_colorscheme('my-colorscheme', _custom_ui_colorscheme)
    """
    repl.use_ui_colorscheme('my-colorscheme')
    """

    # Typing 'jj' in Vi Insert mode, should send escape. (Go back to navigation
    # mode.)
    @repl.add_key_binding('j', 'j', filter=ViInsertMode())
    def _(event):
        " Map 'jj' to Escape. "
        event.cli.input_processor.feed(KeyPress(Keys.Escape))

    # Custom key binding for some simple autocorrection while typing.
    """
    corrections = {
        'impotr': 'import',
        'pritn': 'print',
    }

    @repl.add_key_binding(' ')
    def _(event):
        ' When a space is pressed. Check & correct word before cursor. '
        b = event.cli.current_buffer
        w = b.document.get_word_before_cursor()

        if w is not None:
            if w in corrections:
                b.delete_before_cursor(count=len(w))
                b.insert_text(corrections[w])

        b.insert_text(' ')
    """
