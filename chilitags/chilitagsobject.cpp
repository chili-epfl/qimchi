#include "chilitagsobject.h"

#include "chilitagsdetection.h"

ChilitagsObject::ChilitagsObject(QQuickItem *parent)
    : QQuickItem(parent)
{
    //FIXME: the parentChanged signal is the only reason
    // that we need ChilitagsObject to be a QQuickItem
    // ... maybe there is a better way
    connect(this, &QQuickItem::parentChanged,
            this, &ChilitagsObject::changeParent);
}

void ChilitagsObject::tagUpdate(const QVariantMap & tags) {
    m_tags = tags;
    auto tagIt = tags.find(m_name);
    bool wasVisible = m_visible;
    m_visible = tagIt != tags.end();
    if (wasVisible != m_visible) emit visibilityChanged(m_visible);
    if (m_visible) {
        m_transform = tagIt->value<QMatrix4x4>();
        emit transformChanged(m_transform);
    }
}

void ChilitagsObject::changeParent(QQuickItem *parent) {
    //FIXME: we probably need to disconnect the previous parent, don't we ?
    if (parent)
        connect((ChilitagsDetection *) parent, &ChilitagsDetection::tagsChanged,
            this, &ChilitagsObject::tagUpdate);
}
