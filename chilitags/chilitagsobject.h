#ifndef ChilitagsObject_H
#define ChilitagsObject_H

#include <QQuickItem>
#include <QMatrix4x4>

class ChilitagsObject : public QQuickItem
{
    Q_OBJECT
    Q_PROPERTY(QString name READ name WRITE setName)
    Q_PROPERTY(bool visible READ visible NOTIFY visibilityChanged)
    Q_PROPERTY(QMatrix4x4 transform READ transform NOTIFY transformChanged)

public:
    explicit ChilitagsObject(QQuickItem *parent = 0);

    QString name() const {return m_name;}
    void setName(const QString &name) {m_name = name;}

    bool visible() const {return m_visible;}

    QMatrix4x4 transform() const {return m_transform;}

signals:
    void visibilityChanged(bool visible);

    void transformChanged(QMatrix4x4 transform);

public slots:
    void tagUpdate(const QVariantMap & tags);

    void changeParent(QQuickItem *parent);

private:
    QString m_name;
    QVariantMap m_tags;
    bool m_visible;
    QMatrix4x4 m_transform;
};

#endif
