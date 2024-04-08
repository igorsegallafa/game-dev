/**

Is really hard to say if this code have a memory leak as
I don't know the behaviour of `loadPlayerByName` function. 

But I see a possible case that will have memory leak, that is when the code
create `Player` pointer and the `loadPlayerByName` function returns false, 
on this case we must do the delete of pointer to avoid memory leak.
  
**/

void Game::addItemToPlayer(const std::string& recipient, uint16_t itemId)
{
  Player* player = g_game.getPlayerByName(recipient);
  if (!player) {
    player = new Player(nullptr);
    if (!IOLoginData::loadPlayerByName(player, recipient)) {
      delete player;
      return;
    }
  }

  Item* item = Item::CreateItem(itemId);
  if (!item) {
    return;
  }

  g_game.internalAddItem(player->getInbox(), item, INDEX_WHEREEVER, FLAG_NOLIMIT);

  if (player->isOffline()) {
    IOLoginData::savePlayer(player);
  }
}
