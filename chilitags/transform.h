#ifndef TRANSFORM_H
#define TRANSFORM_H

#include <QQuickTransform>
#include <QMatrix4x4>

class Transform : public QQuickTransform
{
    Q_OBJECT
    //TODO make it a default property
    Q_PROPERTY(QMatrix4x4 matrix READ matrix WRITE setMatrix NOTIFY matrixChanged)

public:
    explicit Transform(QQuickItem *parent = 0);

    QMatrix4x4 matrix() const;
    void setMatrix(QMatrix4x4 matrix);

    virtual void applyTo(QMatrix4x4 *matrix) const;

signals:
    void matrixChanged();

private:
    QMatrix4x4 m_matrix;
};

#endif // TRANSFORM_H
