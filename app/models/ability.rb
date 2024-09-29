class Ability
  include CanCan::Ability

  def initialize(user)
    user ||= User.new # гість (незалогінений користувач)

    if user.admin?
      # Адміністратор може керувати альбомами (створювати, редагувати, видаляти)
      can :manage, Album
      can :manage, Song
    end

    # Всі користувачі можуть переглядати альбоми та пісні
    can :read, Album
    can :read, Song

    # Всі користувачі можуть створювати плейлисти та додавати до них пісні
    can :create, Playlist
    can :add_song, Playlist

    # Додаткові права можна додати тут
  end
end
