Set<String> fruitsSet = new Set<String>();
fruitsSet.add('banana');
fruitsSet.add('mango');
fruitsSet.add('strawberries');
fruitsSet.add('apple');

system.debug(fruitsSet);
system.debug(fruitsSet.size());
system.debug(fruitsSet.add('appricot'));
Boolean containsApr =fruitsSet.contains('appricot');
system.debug('Contains  apricot= ' + containsApr);
Boolean isEmptySet =fruitsSet.isEmpty();
system.debug('is empty fruitset= ' + isEmptySet);