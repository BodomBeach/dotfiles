// an example to create a new mapping `ctrl-y`
mapkey('<Ctrl-y>', 'Show me the money', function() {
  Front.showPopup('Coucou');
});

// history
unmap('<Ctrl-h>');

// search engines
unmap('sg');
unmap('sd');
unmap('sb');
unmap('se');
unmap('sw');
unmap('ss');
unmap('sh');
unmap('sy');

// an example to replace `T` with `gt`, click `Default mappings` to see how `T` works.
map('yv', 's');