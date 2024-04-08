void Creature::draw(const Point& dest, float scaleFactor, bool animate, LightView *lightView)
{
    float oldAlphaValue = m_outfitColor.aF();
    int directionX = 0;
    int directionY = 0;

    if (m_direction == Otc::North)
    {
        directionX = 0;
        directionY = 1;
    }
    else if (m_direction == Otc::South)
    {
        directionX = 0;
        directionY = -1;
    }
    else if (m_direction == Otc::East)
    {
        directionX = -1;
        directionY = 0;
    }
    else if (m_direction == Otc::West)
    {
        directionX = 1;
        directionY = 0;
    }

    for(int i = 0; i < 4; i++)
    {
        m_outfitColor.setAlpha(0.8f - (0.2f * i));
        internalDrawOutfit(dest + Point(14 * i * directionX, 14 * i * directionY) + animationOffset * scaleFactor, scaleFactor, animate, animate, m_direction);
    }

    m_outfitColor.setAlpha(oldAlphaValue);
    internalDrawOutfit(dest + animationOffset * scaleFactor, scaleFactor, animate, animate, m_direction);
}