// an example to create a new mapping `ctrl-y`
mapkey('<Ctrl-y>', 'Show me the money', function() {
  Front.showPopup('Coucou');
});

// history
unmap('<Ctrl-h>');

// search engines
unmap('s');
unmap('sg');
unmap('sd');
unmap('sb');
unmap('se');
unmap('sw');
unmap('ss');
unmap('sh');
unmap('sy');

mapkey('s', '#7Yank text of an element', function() {
  Visual.toggle("y");
});